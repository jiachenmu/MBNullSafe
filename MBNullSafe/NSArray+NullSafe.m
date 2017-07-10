//
//  NSArray+NullSafe.m
//  Pods
//
//  Created by ManoBoo on 2017/6/30.
//
//

#import "NSArray+NullSafe.h"

#import "NSObject+NullSafe.h"


@implementation NSArray (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
    });
}

#pragma mark - Method

- (id)safe_objectAtIndex: (NSUInteger)index {
    if (index < self.count) {
        return [self safe_objectAtIndex:index];
    }else {
        NSLog(@"[NSArray objectAtIndex: index], index is beyond bounds");
        return nil;
    }
}

@end

