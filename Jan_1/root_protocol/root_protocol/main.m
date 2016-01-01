//
//  main.m
//  root_protocol
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "MyProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject* obj = @"1234";
        NSLog(@"%@", obj);

        // 创建一个遵守MyProtocol的NSObject对象
        NSObject<MyProtocol>* obj1 = [[Person alloc] init];//[[NSObject alloc] init];
        // obj1此时只能保持遵守NSObject和My Protocol协议的对象
        obj1 = nil;

        id<MyProtocol> obj2 = [[Person alloc] init];
        obj2 = nil;

    }
    return 0;
}
