//
//  main.m
//  description
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person* p1 = [[Person alloc] init];
    p1.age = 10;
    p1.name = @"John";

    Class c = [Person class]; // c为类类型，是一个指针类型，指向Person这个类

    //下面会调用类的＋description方法，其返回值也是（NSString＊）类型
    NSLog(@"%@",c);

    /*
     1. NSLog会调用对象p1的－description方法
     2. －description方法默认返回“类名＋内存地址”字符串。
     */

    NSLog(@"%@", p1); // %@ 能够打印OC对象，但这样只打出Person对象的内存地址
                      // 通过override父类NSObject的-description方法，我们可以控制NSLog输出对象的方式

    NSLog(@"%s", __FILE__); // NSLog输出C语言字符串的时候，不能有中文

    NSLog(@"%@", NSStringFromClass([p1 class]));
    //NSLog(@"%@", NSStringFromSelector(<#SEL  _Nonnull aSelector#>))

    return 0;
}
