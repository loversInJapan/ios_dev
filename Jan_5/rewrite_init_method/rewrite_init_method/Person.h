//
//  Person.h
//  rewrite_init_method
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, assign) unsigned age;
@property(nonatomic, strong) NSString* name;

- (id)initWithAge:(unsigned)age AndName:(NSString*)name;

@end
