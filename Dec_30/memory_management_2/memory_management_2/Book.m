//
//  Book.m
//  memory_management_2
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Book.h"

@implementation Book

- (void)setPrice:(double)price
{
    _price = price;
}

- (double)price
{
    return _price;
}

- (void)dealloc
{
    NSLog(@"Book instance is destroy");
    [super dealloc];
}
@end
