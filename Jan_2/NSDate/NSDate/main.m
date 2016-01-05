//
//  main.m
//  NSDate
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate* date = [NSDate date]; // 创建出来的NSDate的对象含有当前的时间
        NSLog(@"%@", date); // 打印的是格林尼治时间

        // 将日期转化为字符串
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/yyyy HH:mm:ss"; // 后面这个字符串是固定表达
        NSString* str = [formatter stringFromDate:date];
        NSLog(@"%@", str);

        // 将字符串转化成日期
        NSString* time = @"2/2016/1 22:13:34";
        NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
        formatter1.dateFormat = @"dd/yyyy/MM HH:mm:ss";
        NSDate* date1 = [formatter1 dateFromString:time];
        NSLog(@"%@", date1);
    }
    return 0;
}
