//
//  cars.m
//  汽车品牌概览
//
//  Created by Jon_Snow on 1/28/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "car.h"

@implementation car
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carsListWithArray:(NSArray*)array
{
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self carWithDict:dict]];
    }
    return arrayM;
}
@end
