//
//  Person.h
//  use_autorelease
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, assign) int age;

+ (id)person;

+ (instancetype)personWithAge:(int)age;

@end
