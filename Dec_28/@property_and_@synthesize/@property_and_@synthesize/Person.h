//
//  Person.h
//  @property_and_@synthesize
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
//    int _age;
//    int age;
//    double _height;
}

// @property（只能用在@interface中）：可以根据property后面给的类型和名称，自动生成该类型的以_开头的变量，并且生成该变量的set方法和get方法的声明
@property int _age; // @property还有自动生成成员变量的功能，比如这一句他会自动生成 int __age（两个底杠），但变量的访问权限为@private的
// 上面这句代码等价于下面两行代码
//- (void)set_age:(int);
//- (int)_age;
@property double height; // 生成double _height，同时还生成setter和getter。
//等价于下面两行代码
// - (void)setHeight:(double);
// - (double)height;

- (void)test;
@end
