//
//  main.m
//  ARC_circle_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

/*
 weak一般用在ARC中解决循环应用
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];

        Dog* d = [[Dog alloc] init];
        p.puppy = d;
        d.master = p;  //形成相互引用的问题，参照之前的解决办法，应该一边用strong一边用weak
    }
    return 0;
}
