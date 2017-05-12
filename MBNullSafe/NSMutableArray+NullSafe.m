//
//  NSMutableArray+NullSafe.m
//  Pods
//
//  Created by 贾宸穆 on 2017/5/11.
//
//

#import "NSMutableArray+NullSafe.h"

#import "NSObject+NullSafe.h"


@implementation NSMutableArray (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safe_addObject:)];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
        [obj swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safe_InsertObject:atIndex:)];
        [obj swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(safe_RemoveObjectAtIndex:)];
        [obj swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safe_ReplaceObjectAtIndex:withObject:)];
        
    });
}


#pragma mark - Method

- (void)safe_addObject: (id)obj {
    if (obj) {
        [self safe_addObject:obj];
    }else {
        NullSafeLogFormatter(@"[NSMutableArray addObject: obj], obj couldn't be nil");
    }
}

- (id)safe_objectAtIndex: (NSUInteger)index {
    if (index < self.count) {
        return [self safe_objectAtIndex:index];
    }else {
        NSLog(@"[NSMutableArray objectAtIndex: index], index is beyond bounds");
        return nil;
    }
}

- (void)safe_InsertObject:(id)obj atIndex: (NSUInteger)index {
    if (obj) {
        [self safe_InsertObject:obj atIndex:index];
    }else {
        NullSafeLogFormatter(@"[NSMutableArray insertObject:atIndex:], obj couldn't be nil");
    }
}

- (void)safe_RemoveObjectAtIndex: (NSUInteger)index {
    if (index < self.count) {
        [self safe_RemoveObjectAtIndex:index];
    }else {
        NullSafeLogFormatter(@"[NSMutableArray removeObjectAtIndex], index is beyond bounds");
    }
}

- (void)safe_ReplaceObjectAtIndex: (NSUInteger)index withObject: (id)obj {
    if (index < self.count) {
        if (obj) {
            [self safe_ReplaceObjectAtIndex:index withObject:obj];
        }else {
            NullSafeLogFormatter(@"[NSMutableArray replaceObjectAtIndex: withObject:], object couldn't be nil")
        }
    }else {
        NullSafeLogFormatter(@"[NSMutableArray replaceObjectAtIndex: withObject:], index is beyond bounds")
    }
}

@end
