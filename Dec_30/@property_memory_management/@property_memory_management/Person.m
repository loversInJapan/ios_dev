//
//  Person.m
//  @property_memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_name release]; // release空指针是安全的
    [_book release];

    [super dealloc];
}
@end
