//
//  Person.h
//  proxy_pattern
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProxyProtocol.h"

@interface Person : NSObject

@property(nonatomic, strong) id<ProxyProtocol> agent;
- (void)buyTicket;

@end
