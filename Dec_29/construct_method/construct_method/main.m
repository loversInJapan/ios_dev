//
//  main.m
//  construct_method
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Person* p = [Person new];
    /*
     完整地创建一个可用的对象
     1.分配存储空间 ＋alloc
     2.初始化 －init(即构造方法）
     */
    [p setAge:10];

    // 1. 调用＋alloc分配存储空间
    Person* p1 = [Person alloc];

    // 2. 调用－init进行初始化
    // 3. 开发中一般不要new，而用alloc和init
    p1 = [p1 init];
    [p1 setAge:20];
    NSLog(@"p1 age = %d", [p1 age]);
    // 但开发中经常这样写
    Person* p2 = [[Person alloc] init];
    [p2 setAge:30];

    Student* stu = [Student alloc];
    stu = [stu init];

    return 0;
}
