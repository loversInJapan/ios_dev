//
//  StatusFrame.h
//  Sina Weibo
//
//  Created by Jon_Snow on 2/6/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@class Statuses;

@interface StatusFrame : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect pictureF;

// 每个frame中有一个status
@property (strong, nonatomic) Statuses* status;
// 每个cell的高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;

// frame数组，装载statuses.plist中的每个数据和对应的frame
+ (NSArray*)statusFrames;
@end
