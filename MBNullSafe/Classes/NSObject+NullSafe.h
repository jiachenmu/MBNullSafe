//
//  NSObject+NullSafe.h
//  Pods
//
//  Created by 贾宸穆 on 2017/5/11.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (NullSafe)

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
