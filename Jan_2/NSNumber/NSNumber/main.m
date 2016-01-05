//
//  main.m
//  NSNumber
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSNumber之所以能包装基本数据类型，是因为继承了NSValue

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber* num = [NSNumber numberWithInt:10];
        NSDictionary* dict = @{
          @"name":@"jack",
          @"age":@10 // 编译器为自动将@10包装成NSNumber对象 //num //10 // 错误，NSDictionary只能存对象，需要用NSNumber包装
          };

        @10.5;
        @'a';
        @YES;
        int val = 20;
        @(val); //以上都是讲各种基本数据类型包装NSNumber对象
        int age = [dict[@"age"] intValue];
        NSLog(@"%d", age);

        // NSArray不能装结果体对象，可用NSValue包装后存入NSArray中
        CGPoint p = CGPointMake(10, 10);
        NSValue* value = [NSValue valueWithPoint:p]; // 将结构体包装成NSValue
        NSArray* arr = @[value];
        [value pointerValue]; // 将NSValue转成相应的结果体，相应有sizeValue，rectValue

        NSLog(@"%lf", [@"291.12" doubleValue]); // 字符串转换成数值
    }
    return 0;
}
