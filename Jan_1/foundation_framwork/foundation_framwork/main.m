//
//  main.m
//  foundation_framwork
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         NSRange(location,length)
         NSPoint/CGPoint 开发中用CGPoint，因为CGPoint是跨平台的。用了表示元素的位置
         NSSize/CGSize 用来表示元素的大小
         NSRect/CGRect (CGPoint,CGSize)能够表示一个UI元素的位置和大小
         */
        NSPoint p1 = NSMakePoint(1, 2);
        CGPoint p2 = CGPointMake(3.3, 4.4);  // 开发中常用CGPointMake

        CGSize s1 = CGSizeMake(2.3, 1.2);
        NSSize s2 = NSMakeSize(1.2, 2.1);

        CGRect r1 = CGRectMake(1, 2, 3, 4);

        // 如何看这个结果体里的成员的值
        //NSLog(@"x = %lf, y = %lf, width = %lf, height = %lf",
              //r1.origin.x, r1.origin.y, r1.size.width, r1.size.height); // 很麻烦

        // 开发中先将结构体转成字符串，例如：
        NSString* str = NSStringFromPoint(p1);//NSStringFromRect(r1); // 同理可用于其他结构体
        NSLog(@"%@", str);
    }
    return 0;
}

void range()
{
    NSRange r1 = {2,4}; // 开发中不用，可读性差
    NSRange r2 = {.location = 2, .length = 4}; // 开发中也不用，冗余
    NSRange r3 = NSMakeRange(2, 4); // 记住这种方式

    NSString* str = @"I Love OC";

    NSRange range_of_love = [str rangeOfString:@"Love"];
    NSLog(@"loc:%lu, len:%lu", range_of_love.location, range_of_love.length);
}
