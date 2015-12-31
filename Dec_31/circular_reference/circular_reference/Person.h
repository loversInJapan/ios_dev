//
//  Person.h
//  circular_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
// #import "IDCard.h" // 与IDCard形成循环引用！
@class IDCard; // @class 仅仅时告诉编译器IDCard是一个类

/*
 开发中引用一个类的规范
 1）在.h文件中用@class来声明类
 2）在.m文件中用＃import来包含类的所有东西
 
 两端循环retain的解决方案:循环retain指A对象retainB对象，B对象retainA对象，导致两个对象都无法释放
 1）一端用retain
 2）一端用assign
 */

@interface Person : NSObject

@property(nonatomic, retain) NSString* name;

@property(nonatomic, retain) IDCard* idcard;

@end
