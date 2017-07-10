//
//  NSMutableDictionary+NullSafe.m
//  Pods
//
//  Created by 贾宸穆 on 2017/5/12.
//
//

#import "NSMutableDictionary+NullSafe.h"

#import "NSObject+NullSafe.h"

@implementation NSMutableDictionary (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(safe_setObject:forKey:)];
        
    });
    
}

- (void)safe_setObject:(id)value forKey:(NSString *)key {
    if (value) {
        [self safe_setObject:value forKey:key];
    }else {
        NullSafeLogFormatter(@"[NSMutableDictionary setObject: forKey:], object cannot be nil")
    }
}

@end
