//
//  Person.m
//  user-defined_constructor
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name AndAge:(int)age
{
    if( self = [super init])
    {
        _name = name;
        _age = age;
    }
    return self;
}
@end
