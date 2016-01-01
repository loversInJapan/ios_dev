//
//  Person.m
//  proxy_pattern
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)buyTicket
{
    double price = [_agent ticketPrice];
    unsigned seats = [_agent leftTickets];

    NSLog(@"ticket price = %lf, seats remained = %u", price, seats);
}

@end
