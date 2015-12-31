//
//  Person.m
//  use_autorelease
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"Person of %d years old dealloc", _age);

    [super dealloc];
}

+ (id)person
{
    return [[[self alloc] init] autorelease];
}

+ (instancetype)personWithAge:(int)age
{
    Person* p = [[[self alloc] init] autorelease];
    p.age = age;
    return p;
}
@end
