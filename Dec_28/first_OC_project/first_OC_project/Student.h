//
//  Student.h
//  first_OC_project
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    int _No;
    NSString* _name;
}

- (void)setNo:(int)num;
- (int)No;

- (void)setName:(NSString*)name;
- (NSString*)name;
@end
