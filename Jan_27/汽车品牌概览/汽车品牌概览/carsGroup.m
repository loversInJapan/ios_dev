//
//  carsGroup.m
//  汽车品牌概览
//
//  Created by Jon_Snow on 1/28/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "carsGroup.h"

@implementation carsGroup
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
//        [self setValue:@"title" forKey:@"title"];
//        [self setValue:@"cars" forKey:@"cars"];
        [self setValue:dict[@"title"] forKey:@"title"];

        // dict[@"cars"]存放的是字典的数组
        // 希望将字典的数组转换成HMCar模型的数组
        //        [self setValue:dict[@"cars"] forKey:@"cars"];
        self.cars = [car carsListWithArray:dict[@"cars"]];
    }
    return self;
}

+ (instancetype)carsGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carsGroupList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self carsGroupWithDict:dict]];
    }
    return arrayM;
}
@end
