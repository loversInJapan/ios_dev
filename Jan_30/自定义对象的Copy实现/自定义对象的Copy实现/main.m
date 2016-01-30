//
//  main.m
//  自定义对象的Copy实现
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student* p = [[Student alloc] init];
        p.name = @"lili";
        p.age = 18;
        p.number = @"0001";
        NSLog(@"%@--%@", p, p.number);

        Student* p1 = [p copy];
        p1.name = @"wuwu";
        NSLog(@"%@--%@", p1, p1.number);
    }
    return 0;
}
