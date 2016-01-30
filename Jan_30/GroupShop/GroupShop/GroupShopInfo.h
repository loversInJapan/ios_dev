//
//  GroupShopInfo.h
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupShopInfo : NSObject
@property (copy, nonatomic) NSString* buyCount;
@property (copy, nonatomic) NSString* icon;
@property (copy, nonatomic) NSString* price;
@property (copy, nonatomic) NSString* title;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)groupShopWithDict:(NSDictionary*) dict;
+ (NSArray*)groupShopList;
@end
