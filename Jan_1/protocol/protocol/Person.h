//
//  Person.h
//  protocol
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol_3.h"
#import "Protocol_2.h"

// 只要一个类遵守了某一份协议，就能拥有这份协议中的所有方法声明，协议只能声明方法，不能添加变量和实现方法
// :继承父类
// <>遵守协议

@interface Person : NSObject <Protocol_3, Protocol_2>
// 这样写代表Person中已经拥有了Protocol_1中的所有方法了, 协议可以多继承，如这里继承了2个协议

// - (void)test;

// - (void)test1;

@end
