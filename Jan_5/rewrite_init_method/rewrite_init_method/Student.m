//
//  Student.m
//  rewrite_init_method
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    if(self = [super init]){
        _No = @"none";
    }
    return self;
}

- (id)initWithAge:(unsigned int)age AndName:(NSString *)name AndNo:(NSString *)No
{
    if(self = [super initWithAge:age AndName:name]){
        _No = No;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, No:%@", [super description], _No];
}

@end
