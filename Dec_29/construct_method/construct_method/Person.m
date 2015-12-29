//
//  Person.m
//  construct_method
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Person.h"

@implementation Person

// 重写构造方法
- (instancetype)init
{
    // 1.一定要回调super的init方法:初始化父类中的声明和成员变量：比如初始化NSObject中的isa对象
    self = [super init]; // 返回当前对象self

    // 2.只要对象初始化成功，才有必要进行接下来的初始化
    if(self != nil) // 初始化成功 // 精简：if(self = [super init])
    {
        _age = 10;
    }
    // 3.返回一个已经初始化完毕的对象
    return self;
}
@end
