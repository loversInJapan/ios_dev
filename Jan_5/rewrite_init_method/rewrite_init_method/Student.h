//
//  Student.h
//  rewrite_init_method
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student : Person

@property(nonatomic, strong) NSString* No;

- (id)initWithAge:(unsigned int)age AndName:(NSString *)name AndNo:(NSString*)No;

@end
