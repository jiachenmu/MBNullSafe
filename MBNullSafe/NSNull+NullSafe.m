//
//  NSNull+NullSafe.m
//  ManoBooGuideView
//
//  Created by 贾宸穆 on 2017/5/15.
//  Copyright © 2017年 group.ManoBoo. All rights reserved.
//

#import "NSNull+NullSafe.h"

#import <objc/runtime.h>

#ifndef NULLSAFE_ENABLED
#define NULLSAFE_ENABLED 1
#endif


@implementation NSNull (NullSafe)

#if NULLSAFE_ENABLED

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    @synchronized ([self class]) {
        NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
        if (!signature) {
            static NSMutableSet *classList = nil;
            static NSMutableDictionary *signatureCache = nil;
            
            if (!signatureCache) {
                
                classList = [[NSMutableSet alloc] init];
                signatureCache = [[NSMutableDictionary alloc] init];
                
                // 获取所有的类
                int numClasses = objc_getClassList(NULL, 0);
                Class *classes = (Class *)malloc(sizeof(Class) * (unsigned long)numClasses);
                numClasses = objc_getClassList(classes, numClasses);
                
                NSMutableSet *excluded = [NSMutableSet set];
                for (int i = 0; i < numClasses; i++) {
                    
                    // 将有父类的class 记录下来
                    Class someClass = classes[i];
                    Class superClass = class_getSuperclass(someClass);
                    while (superClass) {
                        if (superClass == [NSObject class]) {
                            [classList addObject:someClass];
                            break;
                        }
                        [excluded addObject:NSStringFromClass(superClass)];
                        superClass = class_getSuperclass(superClass);
                    }
                }
                
                // 移除所有有子类的class
                for (Class someClass in excluded) {
                    [classList removeObject:someClass];
                }
                
                free(classes);
            }
            
            // 检查implementation的实现
            NSString *selectorString = NSStringFromSelector(aSelector);
            signature = signatureCache[selectorString];
            if (!signature) {
                // implementation 中未找到
                for (Class someCalss in classList) {
                    if ([someCalss instancesRespondToSelector:aSelector]) {
                        signature = [someCalss instanceMethodSignatureForSelector:aSelector];
                        break;
                    }
                }
                
                // 添加到缓存中
                signatureCache[selectorString] = signature ?: [NSNull null];
            }else if ([signature isKindOfClass:[NSNull class]]) {
                signature = nil;
            }
        }
        
        return signature;
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 给 nil对象发送消息 不会执行，所以 targer 设置为 nil， 会避免因为 NSNull造成的崩溃
    anInvocation.target = nil;
    [anInvocation invoke];
}

#endif


@end
