//
//  main.m
//  circular_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "IDCard.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IDCard* ID = [[IDCard alloc] init];
        ID.cardNumber = @"10002";

        Person* Bob = [[Person alloc] init];
        Bob.name = @"Bob";
        Bob.idcard = ID;

        NSLog(@"Bob's ID number = %@", Bob.idcard.cardNumber);
    }
    return 0;
}
