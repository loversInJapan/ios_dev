//
//  MessageModelFrame.m
//  QQMessageUI
//
//  Created by Jon_Snow on 2/19/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "MessageModelFrame.h"
#import "MessageModel.h"
#import <UIKit/UIKit.h>
#import "Constants.h"

@implementation MessageModelFrame
- (void)setMessage:(MessageModel *)message
{
    _message = message;
    
    // 时间frame
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = kScreenW;
    CGFloat timeH = kNormoalH;
    _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);

    // 头像的frame
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeFrame);
    CGFloat iconW = kIconW;
    CGFloat iconH = kIconH;
    if (message.type == MessageModelMe) {
        iconX = kPadding;
    } else {
        iconX = kScreenW - kPadding - kIconW;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    // 正文的frame
    CGFloat textX;
    CGFloat textY = iconY + kPadding;
    NSDictionary* dict = @{NSFontAttributeName:kTextFont};
    CGRect textRealFrame = [message.text boundingRectWithSize:CGSizeMake(150, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    if (message.type == MessageModelMe) {
        textX = CGRectGetMaxX(_iconFrame) + kPadding;
    } else {
        textX = kScreenW - kPadding - iconW - kPadding - textRealFrame.size.width;
    }
    textRealFrame.origin.x = textX;
    textRealFrame.origin.y = textY;
    _textFrame = textRealFrame;

    // cell的高度
    _cellH = MAX(CGRectGetMaxY(_iconFrame), CGRectGetMaxY(_textFrame)) + 2 * kPadding;
}

+ (NSMutableArray *)messageModelFrames
{
    NSArray* messages = [MessageModel messageList];
    NSMutableArray* arrM = [NSMutableArray array];
    for (MessageModel* message in messages) {
        MessageModelFrame* messageFrame = [[MessageModelFrame alloc] init];
        messageFrame.message = message;

        [arrM addObject:messageFrame];
    }
    return arrM;
}
@end
