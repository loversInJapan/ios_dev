//
//  Person.m
//  NSCopying_NSMutableCopying
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nname:%@\nage:%lu", _name, _age];
}

- (id)copyWithZone:(NSZone *)zone
{
    id p = [[[self class] allocWithZone:zone] init];
    [p setName:[self.name copy]];
    [p setAge:self.age];
    return p;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    //id mp = NSCopyObject(self, 0, zone);
    id p = [[[self class] allocWithZone:zone] init];
    [p setName:[self.name mutableCopy]];
    [p setAge:self.age];
    return p;
}
@end
