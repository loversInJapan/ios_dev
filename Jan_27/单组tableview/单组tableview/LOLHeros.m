//
//  LOLHeros.m
//  单组tableview
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "LOLHeros.h"

@implementation LOLHeros
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)herosList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self heroWithDict:dict]];
    }
    return arrayM;
}
@end
