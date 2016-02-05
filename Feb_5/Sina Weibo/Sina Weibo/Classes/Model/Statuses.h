//
//  Statuses.h
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Statuses : NSObject

@property (copy, nonatomic) NSString* icon;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* picture;
@property (copy, nonatomic) NSString* text;

@property (assign, nonatomic) BOOL vip;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)statusWithDict:(NSDictionary*) dict;
+ (NSArray*)statusList;
@end
