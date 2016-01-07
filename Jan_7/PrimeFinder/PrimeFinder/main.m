//
//  main.m
//  PrimeFinder
//
//  Created by Jon_Snow on 1/7/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrimeFinder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PrimeFinder* pf = [[PrimeFinder alloc] initWithMaxNumber:100000];

        [pf start];

        NSLog(@"excuted time:%f", [pf excuteTime]);
    }
    return 0;
}
