//
//  NSObject+NullSafe.h
//  Pods
//
//  Created by 贾宸穆 on 2017/5/11.
//
//

#import <Foundation/Foundation.h>


// NullSafeDebugMode = 0    =>  when occured nil exception, application will exit;
#define NullSafeDebugMode 1

#define NullSafeLogFormatter(exceptionInfo) \
            printf("----------------NullSafe-----------------\n");          \
            NSLog(exceptionInfo);                                           \
            NullSafeAssert(exceptionInfo);                                  \
            printf("-----------------------------------------\n");          \

#define NullSafeAssert(exceptionInfo) NSAssert(NullSafeDebugMode != 0, exceptionInfo);

@interface NSObject (NullSafe)

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
