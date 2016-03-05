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
    if (message.shouldHideTime == NO) {
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = kScreenW;
        CGFloat timeH = kNormoalH;
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }

    // 头像的frame
    CGFloat iconX;
    CGFloat iconY;
    CGFloat iconW = kIconW;
    CGFloat iconH = kIconH;
    if (message.type == MessageModelMe) {
        iconX = kPadding;
    } else {
        iconX = kScreenW - kPadding - kIconW;
    }
    if (message.shouldHideTime == NO) {
        iconY = CGRectGetMaxY(_timeFrame);
    }else{
        iconY = kPadding;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    // 正文的frame
    CGFloat textX;
    CGFloat textY = iconY;
    NSDictionary* dict = @{NSFontAttributeName:kTextFont};
    CGRect textRealFrame = [message.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    // 加大宽高，因为textButton加了edge
    textRealFrame.size.width += (2 * kBtnInsetEdge); //左右边都加了edge，所以宽应该加两倍的edge宽
    textRealFrame.size.height += (2 * kBtnInsetEdge); //同上
    if (message.type == MessageModelMe) {
        textX = CGRectGetMaxX(_iconFrame) + kPadding;
    } else {
        textX = kScreenW - kPadding - iconW - kPadding - textRealFrame.size.width;
    }
    textRealFrame.origin.x = textX;
    textRealFrame.origin.y = textY;
    _textFrame = textRealFrame;

    // cell的高度
    _cellH = MAX(CGRectGetMaxY(_iconFrame), CGRectGetMaxY(_textFrame)) + kPadding;
}

+ (NSMutableArray *)messageModelFrames
{
    NSArray* messages = [MessageModel messageList];
    NSMutableArray* arrM = [NSMutableArray array];
    for (MessageModel* message in messages) {
        MessageModelFrame* messageFrame = [[MessageModelFrame alloc] init];
        // 获取数组中的最后一个对象
        MessageModelFrame* lastFrame = [arrM lastObject];
        // 比较时间是否相同，并把结果赋予shuoldHideTime
        message.shouldHideTime = [lastFrame.message.time isEqualToString:message.time];

        messageFrame.message = message;
        [arrM addObject:messageFrame];
    }
    return arrM;
}
@end
