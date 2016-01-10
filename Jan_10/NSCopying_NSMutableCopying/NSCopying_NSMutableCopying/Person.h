//
//  Person.h
//  NSCopying_NSMutableCopying
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, strong) NSMutableString* name;  // 注意不能将这里的strong换成copy。具体原因尚且不知。
@property (nonatomic, assign) NSInteger age;

@end
