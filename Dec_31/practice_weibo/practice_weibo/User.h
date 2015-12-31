//
//  User.h
//  practice_weibo
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SexMan,
    SexWoman
} Sex;

typedef struct {
    int year;
    int month;
    int day;
} Date;

@interface User : NSObject

@property(nonatomic, retain) NSString* name;

@property(nonatomic, retain) NSString* account;

@property(nonatomic, retain) NSString* icon;

@property(nonatomic, retain) NSString* passwd;

@property(nonatomic, assign) Sex sex;

@property(nonatomic, retain) NSString* phoneNum;

@property(nonatomic, assign) Date birthday;

@end
