//
//  Person.m
//  circular_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"
#import "IDCard.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"dealloc Person");
}
@end
