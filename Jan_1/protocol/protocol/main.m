//
//  main.m
//  protocol
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 协议主要用于设计模式：代理模式和观察者模式

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [[Person alloc] init];
        [p test];
        [p test1];
        [p hehe];
    }
    return 0;
}
