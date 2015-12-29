//
//  Student.m
//  user-defined_constructor
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithNumber:(int)no
{
    if ( self = [super initWithName:@"" AndAge:1001]) {
        _number = no;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name AndAge:(int)age AndNumber:(int)no
{
    if (self = [super initWithName:name AndAge:age]) {
        _number = no;
    }
    return self;
}
@end
