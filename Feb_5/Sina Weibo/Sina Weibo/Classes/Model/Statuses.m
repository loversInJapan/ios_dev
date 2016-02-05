//
//  Statuses.m
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Statuses.h"

@implementation Statuses
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)statusList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self statusWithDict:dict]];
    }
    return arrayM;
}
@end
