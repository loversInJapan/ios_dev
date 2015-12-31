//
//  Book.m
//  @property_memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Book.h"

@implementation Book

- (void)dealloc
{
    [_name release];

    [super dealloc];
}
@end
