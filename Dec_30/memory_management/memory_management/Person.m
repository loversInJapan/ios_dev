//
//  Person.m
//  memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"call Person dealloc");

    [super dealloc]; // 一定要调用super的dealloc，且放在最后
}
@end
