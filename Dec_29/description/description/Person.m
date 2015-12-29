//
//  Person.m
//  description
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"age = %d, name = %@", self.age, self.name];
    //return @"123";
}

@end
