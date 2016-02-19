//
//  MessageModelFrame.h
//  QQMessageUI
//
//  Created by Jon_Snow on 2/19/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class MessageModel;

@interface MessageModelFrame : NSObject

@property (assign, nonatomic, readonly) CGRect timeFrame;
@property (assign, nonatomic, readonly) CGRect iconFrame;
@property (assign, nonatomic, readonly) CGRect textFrame;
@property (assign, nonatomic, readonly) CGFloat cellH;
@property (strong, nonatomic) MessageModel* message;

+ (NSMutableArray*)messageModelFrames;
@end
