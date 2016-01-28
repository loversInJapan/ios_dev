//
//  cars.h
//  汽车品牌概览
//
//  Created by Jon_Snow on 1/28/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface car : NSObject
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* icon;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)carWithDict:(NSDictionary*) dict;
// 传入一个包含字典的数组，返回一个HMCar模型的数组
+ (NSArray *)carsListWithArray:(NSArray*)array;
@end
