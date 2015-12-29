//
//  NSString+NSString_Number.m
//  add_category_to_NSString
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "NSString+NSString_Number.h"

@implementation NSString (NSString_Number)

+ (unsigned)numCountOfNSString:(NSString *)str
{
    unsigned count = 0;
    unsigned length = (unsigned)[str length];
    for(unsigned i = 0; i < length; ++i){
        char ch = [str characterAtIndex:i];
        if(ch >= '0' && ch <= '9')
            ++count;
    }
    return count;
}

- (unsigned int)numCountMethod
{
    unsigned count = 0;
    unsigned length = (unsigned)[self length];
    for(unsigned i = 0; i < length; ++i){
        char ch = [self characterAtIndex:i];
        if(ch >= '0' && ch <= '9')
            ++count;
    }
    return count;
}
@end
