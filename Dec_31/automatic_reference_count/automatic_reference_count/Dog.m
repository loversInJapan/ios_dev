//
//  Dog.m
//  automatic_reference_count
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)dealloc
{
    NSLog(@"dog %@ is dealloc", _name);
}
@end
