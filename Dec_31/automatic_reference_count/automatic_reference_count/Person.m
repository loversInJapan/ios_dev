//
//  Person.m
//  automatic_reference_count
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"dealloc Person");

    //[super dealloc]; // 在ARC中禁止调用dealloc
}
@end
