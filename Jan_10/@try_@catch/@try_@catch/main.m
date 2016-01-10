//
//  main.m
//  @try_@catch
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Foo* foo = [[Foo alloc] init];
        @try {
            [foo method];
        }
        @catch (NSException *exception) {
            NSLog(@"Caught %@ %@", [exception name], [exception reason]);
        }
        @finally {
            ;
        }
    }
    return 0;
}
