//
//  main.m
//  automatic_reference_count
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

/*
 ARC的判断准则：只要没有强指针指向对象，就会释放对象
 
 ARC特点：
 1）不允许调用release、retain、retainCount
 2）允许重写dealloc，但不允许调用［super dealloc］
 3）@property的参数
 ＊ strong：说明成员变量的指针是强指针，相当于原来的retain（适用于OC对象类型）
 ＊ weak：说明成员变量的指针是强指针，相当于原来的assign（适用于OC对象类型）
 ＊ assign：用于非OC对象类型
 4）相比之前，除了retain改为strong，其他都不变
 
 指针分2种：
 1）强指针（__strong)：默认情况下，所有指针都是强指针
 2）弱指针（__weak)：
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [[Person alloc] init];

        //__weak Person* p2 = p;
        Dog* d1 = [[Dog alloc] init];
        d1.name = @"A";

        Dog* d2 = [[Dog alloc] init];
        d2.name = @"B";

        p.puppy = d1;

        p.puppy = d2;

        //p = nil; // 弱指针p2指向p指向的对象，如果此时将p赋值为0，即p不再指向原来的对象，则该对象就没有强指针指向它，会立即被释放

        //p2 = nil;

        NSLog(@"--------------");
    }
    return 0;
}
