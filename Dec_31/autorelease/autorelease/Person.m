//
//  Person.m
//  autorelease
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"Person dealloc");
    [super dealloc];
}
@end
