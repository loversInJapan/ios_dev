//
//  main.m
//  NSArray
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 NSArray：不可变数组，一旦定义就不可改变。
 
 NSMutableArray：可变数组
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // OC数组只能存放OC对象、不能存放非OC对象类型

        // OC数组的创建
        NSArray* array = [NSArray arrayWithObjects:@"jack", @"rose", nil]; // nil是数组元素结束的标记，不可省略
        NSArray* array1 = @[@"jack", @"rose", @"jon"];

        // 访问数组元素
        NSString* s1 = [array objectAtIndex:0];
        NSString* s = array[1];

        // 数组遍历，可以用c语言的for语句；但开发中常用oc的方法，如下：
        for (id obj in array1) {
            NSLog(@"%@",obj);
        }

        [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"index = %lu, instance = %@", idx, obj);
            if(idx == 1)
                *stop = YES;
        }];
    }
    return 0;
}
