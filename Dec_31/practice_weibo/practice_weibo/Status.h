//
//  Status.h
//  practice_weibo
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

// 微博内容，微博配图，发送时间，微博发送人，转发的微博，被评论数，被转发数
@interface Status : NSObject

@property(nonatomic, retain) NSString* text;

@property(nonatomic, retain) NSString* icon;

@property(nonatomic, assign) time_t time; // 从1970年1月1日一共过了多少毫秒

@property(nonatomic, retain) User* user;

@property(nonatomic, retain) Status* reTweetStatus;

@property(nonatomic, assign) int commentsCount;

@property(nonatomic, assign) int reTweetsCount;
@end
