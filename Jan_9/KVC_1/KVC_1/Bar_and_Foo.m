//
//  Bar_and_Foo.m
//  KVC_1
//
//  Created by Jon_Snow on 1/9/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Bar_and_Foo.h"

@implementation Bar

@end

@implementation Foo

- (instancetype)init
{
    if(self = [super init]){
        _bar = [[Bar alloc] init];
    }
    return self;
}

@end
