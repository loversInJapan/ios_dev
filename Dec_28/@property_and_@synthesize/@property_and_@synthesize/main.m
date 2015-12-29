//
//  main.m
//  @property_and_@synthesize
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person* p = [Person new];
    [p set_age:20];
    [p setHeight:173.5];
    //NSLog(@"age is %d, height is %.2lf", [p _age], [p height]);
    [p test];
    return 0;
}
