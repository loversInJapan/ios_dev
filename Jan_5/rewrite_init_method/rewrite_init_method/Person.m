//
//  Person.m
//  rewrite_init_method
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if(self = [super init]){
        _age = 1;
        _name = @"unnamed";
    }
    return self;
}

- (id)initWithAge:(unsigned)age AndName:(NSString*)name
{
    if(self = [super init]){
        _age = age;
        _name = name;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"age:%u, name:%@", _age, _name];
}

@end
