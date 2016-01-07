//
//  PrimeFinder.h
//  PrimeFinder
//
//  Created by Jon_Snow on 1/7/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrimeFinder : NSObject

@property (nonatomic, assign) NSInteger maxNumber;
@property (nonatomic, strong) NSDate* startDate;
@property (nonatomic, strong) NSDate* endDate;
@property (nonatomic, strong) NSMutableArray* primes;
@property (nonatomic, strong) NSMutableArray* candidates;
@property (nonatomic, readonly) NSTimeInterval excuteTime;

- (id)initWithMaxNumber:(NSInteger)max;
- (void)start;

@end
