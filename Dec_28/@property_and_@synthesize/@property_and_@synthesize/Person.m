//
//  Person.m
//  @property_and_@synthesize
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Person.h"

@implementation Person

// @synthesize自动生成_age的setter和getter实现，并且会访问_age这个变量。
//@synthesize _age = age; // 这样会访问age变量

@synthesize height = _height; //现阶段的Xcode已经可以不用写@synthesize了！！！

//另外，如果@interface中没有age和_height这两个变量，xcode会自动帮我们生成，且访问权限为@private的，因为它们时在.m文件中生成的

- (void)test
{
    //NSLog(@"age = %d, _age = %d", age, _age);
    NSLog(@"_age = %d", __age);
}

@end
