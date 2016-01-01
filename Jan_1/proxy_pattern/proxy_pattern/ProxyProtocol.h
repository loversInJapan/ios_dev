//
//  ProxyProtocol.h
//  proxy_pattern
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProxyProtocol <NSObject>

- (double)ticketPrice;
- (unsigned)leftTickets;

@end
