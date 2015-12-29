//
//  Student.h
//  user-defined_constructor
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property int number;

- (instancetype)initWithNumber:(int)no;
- (instancetype)initWithName:(NSString *)name AndAge:(int)age AndNumber:(int)no;
@end
