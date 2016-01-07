//
//  Person.m
//  -description_and_+description
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    NSString* ret = [NSString stringWithFormat:@"age:%u, name:%@", _age, _name];
    return ret;
}
@end
