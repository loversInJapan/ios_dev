//
//  Student.h
//  自定义对象的Copy实现
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property (copy, nonatomic) NSString* number;
@end
