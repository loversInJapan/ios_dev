//
//  Student.m
//  自定义对象的Copy实现
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Student.h"

@implementation Student
- (id)copyWithZone:(NSZone *)zone
{
    // 直接调用父类的copy方法
    Student* s = [super copyWithZone:zone];
    s.number = self.number;
    return s;
}
@end
