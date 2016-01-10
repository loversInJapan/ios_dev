//
//  Observer.h
//  KVO_1
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint.h"

@interface Observer : NSObject

@property (nonatomic, strong) MyPoint* point;

- (instancetype)initWithPoint:(MyPoint*)inpoint;

@end
