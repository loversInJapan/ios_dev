//
//  main.m
//  NSString
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 NSString：不可变字符串：不可改变字符串的内容
 
 NSMutableString：可变字符串：可以改变字符串的内容
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 字符串创建
        NSString* s1 = @"jack";
        // NSString* s2 = [[NSString alloc] initWithFormat:@"jack"]; // 一般用上面那种
        NSString* s3 = [[NSString alloc] initWithFormat:@"jack is %d", 10];
        NSLog(@"%@", s3);

        // c字符串 －－> OC字符串
        NSString* s4 = [[NSString alloc] initWithUTF8String:"jack"];

        // oc字符串 －－》 C字符串
        const char* cs = [s4 UTF8String];

        // 从文件中读取字符串，涉及到转码问题
        NSString* s5 = [[NSString alloc] initWithContentsOfFile:@"/Users/jon/ios_dev/a.txt" encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"\n%@", s5);

        // 从URL中读取数据
        // file://代表本地文件到路径
        NSURL* url = [[NSURL alloc] initWithString:@"file:///Users/jon/ios_dev/a.txt"];
        NSURL* url2 = [NSURL URLWithString:@"http://www.sina.com.cn"];// 类方法，方便。开发中常用

        NSString* s6 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]; // 同样是类方法，省去alloc和init，节省时间，开发常用
    //[[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"\n%@", s6);
        NSURL* url1 = [[NSURL alloc] initWithString:@"http://www.sina.com.cn"];
        NSString* s7 = [[NSString alloc] initWithContentsOfURL:url1 encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"\n%@", s7);

        // 将字符串写入文件
        [s1 writeToFile:@"/Users/jon/ios_dev/a.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];

    }
    return 0;
}
