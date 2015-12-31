//
//  Person.h
//  ARC_circle_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

@property(nonatomic, strong) Dog* puppy;
@end
