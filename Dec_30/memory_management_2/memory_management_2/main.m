//
//  main.m
//  memory_management_2
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"

/*
 1. 你想使用某个对象，就应该让对象的计数器＋1（让对象做一次retain操作）
 2. 你不想再使用某个对象，就应该让对象的计数器－1（让对象做一次release操作）
 3. 谁retain，谁release
 4. 谁alloc，谁release
 5. set方法的代码规范
    1)基本数据类型，直接赋值
    2）OC对象类型，则如Person的setBook方法那样写
 */
int main(int argc, const char * argv[]) {
    Book *b = [[Book alloc] init];
    b.price = 23.2;
    //[[Book alloc] init].price = 11.1; //这行代码会发生内存泄露，因为没办法release，所以对象没办法销毁
    Person* p = [[Person alloc] init];

    p.book = b;
    //[b release];
    //b = nil;
    NSString* s = @"Jack";// 这一句没用alloc，所以最后没有[s release];
    p.name = s;
    
    [p release];
    //p = nil;
    [b release];
    return 0;
}
