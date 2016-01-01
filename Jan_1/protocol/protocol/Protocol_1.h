//
//  Protocol_1.h
//  protocol
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

// 代表声明了一个名叫Protocol_1的协议
// protocol仅仅用了声明方法。
@protocol Protocol_1 <NSObject>

@required  // 要求实现，不实现就会发出警告，默认为required的
- (void)test;

- (void)test1;

@optional // 不要求实现，不实现不会有警告。   这两个关键字主要用于程序员之间的交流
- (void)test2;

@end
