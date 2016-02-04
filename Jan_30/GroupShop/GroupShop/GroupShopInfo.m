//
//  GroupShopInfo.m
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "GroupShopInfo.h"

@implementation GroupShopInfo
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)groupShopWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)groupShopList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self groupShopWithDict:dict]];
    }
    return arrayM;
}
@end
