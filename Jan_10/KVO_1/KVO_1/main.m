//
//  main.m
//  KVO_1
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint.h"
#import "Observer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyPoint* point = [[MyPoint alloc] init];
        //NSLog(@"%lu", [point ])
        point.x = 42.1;
        point.y = 33.2;

        Observer* observer = [[Observer alloc] initWithPoint:point];

        point.x = 2.1;
        point.y = 1.2;
    }
    return 0;
}
