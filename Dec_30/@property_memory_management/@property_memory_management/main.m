//
//  main.m
//  @property_memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    Book *b = [[Book alloc] init];
    Person* p = [[Person alloc] init];

    p.book = b;
    NSLog(@"%ld", [b retainCount]);

    [p release];
    [b release];
    return 0;
}
