//
//  Person.h
//  user-defined_constructor
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString* name;
@property int age;

// 自定义构造方法的规范：
// 1.一定是对象方法，以－开头
// 2.返回值一般是instancetype类型
// 3.方法名一般以init开头

- (instancetype)initWithName:(NSString*)name AndAge:(int)age;
@end
