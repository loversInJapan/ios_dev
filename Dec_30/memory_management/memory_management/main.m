//
//  main.m
//  memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
// 每个对象都又自己的引用计数器，引用计数器占4个字节
// 给一个对象发送一条retain消息，引用计数器值＋1
// 给一个对象发送一条release消息，引用计数器值－1
// 给对象发送retainCount消息，能获得当前的引用计数器

int main(int argc, const char * argv[]) {
    Person* p = [[Person alloc] init];
    NSUInteger c = [p retainCount];
    NSLog(@"reference count = %ld", c);

    [p retain]; // retain方法返回值为对象本身
    [p release];
    [p release];

//    p.age = 10;
    p = nil;

    // 执行下面代码会发生野指针错误，但执行p＝nil后就不会发生下面的错误
    // OC不存在空指针错误，给空指针发送消息，不报错
    [p release];
    [p release];

    // 野指针：指向僵尸对象（不可用内存）的指针
    // EXC_BAD_ACCSS:访问了一块不可用的内存，即野指针错误。

    return 0;
}
