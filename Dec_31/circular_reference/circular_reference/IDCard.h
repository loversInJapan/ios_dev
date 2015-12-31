//
//  IDCard.h
//  circular_reference
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Person.h" // 与Person形成了循环引用导致错误！！
@class Person;

@interface IDCard : NSObject

@property(nonatomic, retain) NSString* cardNumber;

@property(nonatomic, assign) Person* person;

@end
