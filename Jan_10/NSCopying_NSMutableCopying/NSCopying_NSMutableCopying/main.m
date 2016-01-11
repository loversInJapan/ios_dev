//
//  main.m
//  NSCopying_NSMutableCopying
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person* p1 = [[Person alloc] init];
//        p1.name = @"Tom";
//        p1.age = 10;
//        NSLog(@"%@", p1);
//
//        Person* p2 = [p1 copy]; // 深复制
//        p2.name = @"Neo";
//        p2.age = 11;
//        NSLog(@"%@",p2);
        //NSLog(@"%@", p1);

        Student* stu1 = [[Student alloc] init];
        stu1.name = [NSMutableString stringWithString:@"haha"];
        stu1.age = 10;
        stu1.stuid = 1001;

//        Student* stu2 = [stu1 copy]; // 深复制, 返回不可变副本
//        //[stu2.name appendString:@"--xixi"]; // 没有在property后的括号加copy之前，它也是复制name的地址而已，即stu1中的name也会改变。
//                                            // 加了copy后就会生出copy版本的setter。
//                                            //然而，property属性没有MutableCopy，因此生产的name副本是不可变的
////        [stu2.name appendString:@"--xixi"]; // 错误，因为此时的stu2.name是不可变的
//        NSMutableString* mstr = [NSMutableString stringWithString:stu2.name];
//        [mstr appendString:@"--xixi"];
//        stu2.name = mstr;

        //stu2.stuid = 1003;
        Student* stu2 = [stu1 mutableCopy];
        [[stu2 name] appendString:@"--hehe"];

        NSString* s = @"bigbang";
        NSMutableArray* ms = [s copy];
        NSLog(@"%@", ms);

        NSLog(@"%@", stu1);
        NSLog(@"%@", stu2);
    }
    return 0;
}
