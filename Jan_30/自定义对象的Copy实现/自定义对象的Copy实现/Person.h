//
//  Person.h
//  自定义对象的Copy实现
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

// *** 对于"可变类型"的属性，不要使用copy描述符定义，否则赋值后，就是不可变了！
//@property (nonatomic, copy) NSMutableString *name;
@property (copy, nonatomic) NSString* name;
@property (assign, nonatomic) int age;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)personWithDict:(NSDictionary*) dict;

@end
