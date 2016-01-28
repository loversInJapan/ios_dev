//
//  carsGroup.h
//  汽车品牌概览
//
//  Created by Jon_Snow on 1/28/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "car.h"

@interface carsGroup : NSObject
@property (copy, nonatomic) NSString* title;
/** 车的数组，存放的是cars的模型数据 */
@property (strong, nonatomic) NSArray* cars;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)carsGroupWithDict:(NSDictionary*) dict;
+ (NSArray*)carsGroupList;
@end
