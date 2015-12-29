//
//  Person.m
//  sel
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)test1
{
    NSLog(@"test1");
}

- (void)test2
{
    NSString* str = NSStringFromSelector(_cmd);

    // _cmd代表着当前方法
    NSLog(@"test2 _cmd = %@", str);
}

- (void)test3:(NSString *)str
{
    NSLog(@"%@", str);
}
@end
