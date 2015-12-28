//
//  main.m
//  first_OC_project
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    NSLog(@"hello apple");
    NSString *name1 = [NSString stringWithFormat:@"Micheal"];
    int num = 1100;
    Student* stu = [Student new];
    [stu setAge:12];
    [stu setName:name1];
    [stu setNo:num];
    int age = [stu age];
    NSLog(@"name is %@, No is %d, age is %d", [stu name], [stu No], age);
    return 0;
}
