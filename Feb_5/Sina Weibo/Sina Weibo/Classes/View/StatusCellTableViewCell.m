//
//  StatusCellTableViewCell.m
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "StatusCellTableViewCell.h"
#import "Statuses.h"
// 名字字体大小
#define kNameFont    [UIFont systemFontOfSize:14]

// 正文字体
#define kTextFont    [UIFont systemFontOfSize:16]
@interface StatusCellTableViewCell ()

@property (strong, nonatomic) UIImageView* iconView;
@property (strong, nonatomic) UILabel* nameView;
@property (strong, nonatomic) UIImageView* vipView;
@property (strong, nonatomic) UILabel* textView;
@property (strong, nonatomic) UIImageView* pictureView;

@end

@implementation StatusCellTableViewCell
- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        // 在tableView中添加自视图都添加到contentView中
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)nameView
{
    if (_nameView == nil) {
        _nameView = [[UILabel alloc] init];
        // 在tableView中添加自视图都添加到contentView中
        [self.contentView addSubview:_nameView];
        _nameView.font = kNameFont;
    }
    return _nameView;
}

- (UIImageView *)vipView
{
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        // 在tableView中添加自视图都添加到contentView中
        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

- (UILabel *)textView
{
    if (_textView == nil) {
        _textView = [[UILabel alloc] init];
        // 在tableView中添加自视图都添加到contentView中
        [self.contentView addSubview:_textView];
        _textView.font = kTextFont;
        _textView.numberOfLines = 0;
    }
    return _textView;
}

- (UIImageView *)pictureView
{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc] init];
        // 在tableView中添加自视图都添加到contentView中
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}

- (void)setStatus:(Statuses *)status
{
    _status = status;

    // 设置数据
    [self settingData];

    // 设置位置
    [self settingFrame];
}

- (void)settingData
{
    self.iconView.image = [UIImage imageNamed:self.status.icon];
    self.nameView.text = self.status.name;
    if (self.status.vip) {
        self.vipView.image = [UIImage imageNamed:@"vip"];
        self.nameView.textColor = [UIColor redColor];
    }
    self.textView.text = self.status.text;

    // 配图(可选参数)
    // imageNamed:nil 会出现如下错误：CUICatalog: Invalid asset name supplied: (null), or invalid scale factor: 2.000000
    if (self.status.picture.length > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
}

- (void)settingFrame
{
    // 定义间距
    CGFloat padding = 10;
    // 1.头像的frame
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);

    // 2. 姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占的区域
    // 返回值是一个x,y = 0的CGRect,w,h是计算好的宽高
    //
    // 如果要计算多行的准确高度，需要传入NSStringDrawingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    // context: nil
    NSDictionary* nameDict = @{NSFontAttributeName:kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = CGRectGetMaxX(self.iconView.frame) + padding;
    nameFrame.origin.y = (self.iconView.bounds.size.height - nameFrame.size.height) * 0.5 + padding;
    self.nameView.frame = nameFrame;

    // 3.vip的图像
    CGFloat vipX = CGRectGetMaxX(self.nameView.frame) + padding;
    CGFloat vipY = self.nameView.frame.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);

    // 4.正文
    NSDictionary* textDict = @{NSFontAttributeName:kTextFont};
    CGRect textRect = [self.status.text boundingRectWithSize:CGSizeMake(360, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textRect.origin.x = self.iconView.frame.origin.x;
    textRect.origin.y = CGRectGetMaxY(self.iconView.frame) + padding;
    self.textView.frame = textRect;

    // 5.图像
    CGFloat pictureX = self.iconView.frame.origin.x;
    CGFloat pictureY = CGRectGetMaxY(self.textView.frame) + padding;
    CGFloat pictureW = 200;
    CGFloat pictureH = 150;
    self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
