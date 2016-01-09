//
//  main.m
//  KVC_1
//
//  Created by Jon_Snow on 1/9/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar_and_Foo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Foo* foo = [[Foo alloc] init];
        [foo setValue:@"this is a string in on Foo" forKey:@"stringOnFoo"];
        NSString* s1 = [foo valueForKey:@"stringOnFoo"];
        NSLog(@"%@", s1);
        [foo setValue:@"it's a quick brown fox" forKeyPath:@"bar.stringOnBar"];
        NSString* s2 = [foo valueForKeyPath:@"bar.stringOnBar"];
        NSLog(@"%@", s2);
    }
    return 0;
}
