//
//  main.m
//  rewrite_init_method
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *s = [[Student alloc] initWithAge:10 AndName:@"Alice" AndNo:@"2015001"];
        NSLog(@"%@", s);
    }
    return 0;
}
