//
//  Person.m
//  自定义对象的Copy实现
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"
/**
 自定义对象要实现copy功能
 1> 遵守NSCopying协议，本质上就是方便程序员编写代码时候，有快捷提示
 2> 实现- (id)copyWithZone:(NSZone *)zone
 */

@implementation Person

// zone，区域，极少用
// 所有的copy方法，最终都会调用copyWithZone
// copy操作将一个对象，复制(当前对象的属性)给一个新的对象
- (id)copyWithZone:(NSZone *)zone
{
    // 1> 实例化对象，self 是对象
    // self.class能够保证继承的子类同样使用copy方法
    Person* p = [[self.class alloc] init];

    //2. 给新对象的属性赋值
    p.name = self.name;
    p.age = self.age;

    // 3.返回新对象
    return p;
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@--%p> {name:%@, age:%d}", self.class, self, self.name,self.age];
}
@end
