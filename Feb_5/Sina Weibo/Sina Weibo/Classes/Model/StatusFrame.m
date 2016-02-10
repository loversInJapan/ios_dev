//
//  StatusFrame.m
//  Sina Weibo
//
//  Created by Jon_Snow on 2/6/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "StatusFrame.h"
#import "Statuses.h"
#import <UIKit/UIKit.h>

// 名字字体大小
#define kNameFont    [UIFont systemFontOfSize:14]

// 正文字体
#define kTextFont    [UIFont systemFontOfSize:16]

@implementation StatusFrame
- (void)setStatus:(Statuses *)status
{
    _status = status;
    // 定义间距
    CGFloat padding = 10;
    // 1.头像的frame
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);

    // 2. 姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占的区域
    // 返回值是一个x,y = 0的CGRect,w,h是计算好的宽高
    //
    // 如果要计算多行的准确高度，需要传入NSStringDrawingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    // context: nil
    NSDictionary* nameDict = @{NSFontAttributeName:kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconF) + padding;
    nameFrame.origin.y = (self.iconF.size.height - nameFrame.size.height) * 0.5 + padding;
    _nameF = nameFrame;

    // 3.vip的图像
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);

    // 4.正文
    NSDictionary* textDict = @{NSFontAttributeName:kTextFont};
    CGRect textRect = [self.status.text boundingRectWithSize:CGSizeMake(360, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textRect.origin.x = self.iconF.origin.x;
    textRect.origin.y = CGRectGetMaxY(self.iconF) + padding;
    _textF = textRect;

    // 5.图像
    if (self.status.picture.length > 0) {
        CGFloat pictureX = self.iconF.origin.x;
        CGFloat pictureY = CGRectGetMaxY(self.textF) + padding;
        CGFloat pictureW = 200;
        CGFloat pictureH = 200;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);

        _cellHeight = CGRectGetMaxY(self.pictureF) + padding;
    }else{
        _cellHeight = CGRectGetMaxY(self.textF) + padding;
    }

}

+ (NSArray *)statusFrames
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        Statuses* status = [Statuses statusWithDict:dict];

        StatusFrame* frame = [[StatusFrame alloc] init];

        frame.status = status;

        [arrayM addObject:frame];
    }
    return arrayM;
}
@end
