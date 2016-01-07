//
//  PrimeFinder.m
//  PrimeFinder
//
//  Created by Jon_Snow on 1/7/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "PrimeFinder.h"

@implementation PrimeFinder

- (id)initWithMaxNumber:(NSInteger)max
{
    if(self = [super init]){
        _maxNumber = max;
        //_primes = [[NSMutableArray alloc] init];
        _candidates = [[NSMutableArray alloc] init];
        for(NSInteger n = 2; n < _maxNumber; ++n)
            [_candidates addObject:[NSNumber numberWithInteger:n]];
    }
    return self;
}

- (NSMutableArray*)filterArray:(NSMutableArray*)m_arraay WithBlock:(BOOL(^)(id))block
{
    NSMutableArray* ret = [[NSMutableArray alloc] init];
    for(id item in m_arraay)
        if(block(item))
            [ret addObject:item];

    return ret;
}

- (BOOL)isPrime:(NSInteger)number
{
    for(NSInteger n = 2; n < number; ++n)
        if(number % n == 0)
            return NO;
    return YES;
}

- (void)start
{
    [self setStartDate:[NSDate date]];

    BOOL(^isPrime)(id) = ^(id obj){
        NSInteger num = [obj integerValue];
        for(NSInteger n = 2; n < num; ++n)
            if(num % n == 0)
                return NO;
        return YES;
    };
//
//    for(NSInteger n = 2; n <= _maxNumber; ++n){
//        if([self isPrime:n])
//            [_primes addObject:[NSNumber numberWithInteger:n]];
//    }
    [self setPrimes:[self filterArray:_candidates WithBlock:isPrime]];

    [self setEndDate:[NSDate date]];
}

- (NSTimeInterval)excuteTime
{
    return [_endDate timeIntervalSinceDate:_startDate];
}

@end
