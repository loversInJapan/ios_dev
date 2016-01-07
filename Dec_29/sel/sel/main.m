//
//  main.m
//  sel
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// SEL s1 = -test1
// SEL s2 = -test2
// 类中每个SEL数据对应一个方法的地址，SEL是一种数据类型，类似于函数指针

int main(int argc, const char * argv[]) {
    Person* p = [[Person alloc] init];
    SEL s1 = @selector(test1);
    [p performSelector:s1]; // 上面两行把test1包装成SEL类型的数据，然后再去类找相应的SEL，得到该方法的地址，然后调用该方法

    [p performSelector:@selector(test2)];// @selector能将其他类型的数据转换成SEL类型

    [p performSelector:@selector(test3:) withObject:@"test3:"]; // 注意test3后要加：，因为冒号也是函数名的一部分
    return 0;
}
