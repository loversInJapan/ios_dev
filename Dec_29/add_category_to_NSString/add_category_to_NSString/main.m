//
//  main.m
//  add_category_to_NSString
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+NSString_Number.h"

int main(int argc, const char * argv[]) {
    NSString* str = @"abcd1234kaksie5lad0";
    NSLog(@"numbers = %d", [NSString numCountOfNSString:str]);
    NSLog(@"numbers = %d", [@"891ab4" numCountMethod]);
    return 0;
}
