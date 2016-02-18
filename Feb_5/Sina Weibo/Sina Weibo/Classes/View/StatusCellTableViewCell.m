//
//  StatusCellTableViewCell.m
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "StatusCellTableViewCell.h"
#import "Statuses.h"
#import "StatusFrame.h"

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
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = YES;
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

- (void)setCellFrame:(StatusFrame *)cellFrame
{
    _cellFrame = cellFrame;

    // 设置数据
    [self settingData];

    // 设置位置
    [self settingFrame];
}

- (void)settingData
{
    self.iconView.image = [UIImage imageNamed:self.cellFrame.status.icon];
    self.nameView.text = self.cellFrame.status.name;
    if (self.cellFrame.status.vip) {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }else{
//        self.vipView.hidden = YES;
        self.nameView.textColor = [UIColor blackColor];
    }
    self.textView.text = self.cellFrame.status.text;

    // 配图(可选参数)
    // imageNamed:nil 会出现如下错误：CUICatalog: Invalid asset name supplied: (null), or invalid scale factor: 2.000000
    if (self.cellFrame.status.picture.length > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.cellFrame.status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
}

- (void)settingFrame
{
    self.iconView.frame = self.cellFrame.iconF;
    self.nameView.frame = self.cellFrame.nameF;
    self.vipView.frame = self.cellFrame.vipF;
    self.textView.frame = self.cellFrame.textF;
    if (self.cellFrame.status.picture.length > 0) {
        self.pictureView.frame = self.cellFrame.pictureF;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
