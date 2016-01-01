//
//  Protocol_3.h
//  protocol
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol_1.h"

@protocol Protocol_3 <Protocol_1> // 协议可以遵守另一个协议

@required
- (void)hehe;

@end
