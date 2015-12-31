//
//  Person.h
//  automatic_reference_count
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property(nonatomic, strong) Dog* puppy; // 在ARC中，将以前的retain换成strong，这时strong相当于retain

@end
