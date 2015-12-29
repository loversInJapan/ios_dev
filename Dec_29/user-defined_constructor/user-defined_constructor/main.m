//
//  main.m
//  user-defined_constructor
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Person* p = [[Person alloc] initWithName:@"Micheal" AndAge:13];
    NSLog(@"name = %@, age = %d", [p name], [p age]);

    Student* stu = [[Student alloc] initWithName:@"none" AndAge:20 AndNumber:1002];
    NSLog(@"name = %@, age = %d, number = %d", [stu name], [stu age], [stu number]);

    return 0;
}
