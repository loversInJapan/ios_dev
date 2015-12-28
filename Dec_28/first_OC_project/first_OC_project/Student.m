//
//  Student.m
//  first_OC_project
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Student.h"

@implementation Student

#pragma mark - No setter and getter
- (void)setNo:(int)num
{
    _No = num;
}
- (int)No
{
    return _No;
}

#pragma mark - name setter and getter
- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

@end
