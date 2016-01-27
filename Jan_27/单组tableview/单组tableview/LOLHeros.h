//
//  LOLHeros.h
//  单组tableview
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOLHeros : NSObject
@property (copy, nonatomic) NSString* icon;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* intro;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)heroWithDict:(NSDictionary*) dict;
+ (NSArray*)herosList;
@end
