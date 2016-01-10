//
//  Student.m
//  NSCopying_NSMutableCopying
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone
{
    id stu = [[[self class] allocWithZone:zone] init];
    stu = [super copyWithZone:zone];
    [stu setStuid:self.stuid];
    return stu;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    //id mp = NSCopyObject(self, 0, zone);
    id stu = [[[self class] allocWithZone:zone] init];
    stu = [super mutableCopyWithZone:zone];
    [stu setStuid:self.stuid];

    return stu;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nname:%@\nage:%lu\nid:%lu",
                                        self.name, self.age, self.stuid];
}
@end
