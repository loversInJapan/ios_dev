//
//  MessageCell.m
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "MessageCell.h"
#import "MessageModel.h"
#import "MessageModelFrame.h"
#import "Constants.h"

@interface MessageCell ()
// 头像
@property (nonatomic, strong) UIImageView* icon;
// 时间
@property (strong, nonatomic) UILabel* time;
// 消息
@property (strong, nonatomic) UIButton* textButton;

@end
@implementation MessageCell
- (UIImageView *)icon
{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)time
{
    if (_time == nil) {
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:kTimeFont];
        _time.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_time];
    }
    return _time;
}

- (UIButton *)textButton
{
    if (_textButton == nil) {
        _textButton = [[UIButton alloc] init];
        _textButton.titleLabel.numberOfLines = 0;
        _textButton.titleLabel.font = kTextFont;
        [_textButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_textButton];
    }
    return _textButton;
}

- (void)setMessageFrame:(MessageModelFrame *)messageFrame
{
    _messageFrame = messageFrame;
    [self setCellDataWithMessage:messageFrame.message];
    [self setCellFrame];
}

- (void)setCellDataWithMessage:(MessageModel*)message
{
    if (message.type == 0) {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
        [self.textButton setBackgroundImage:[UIImage imageNamed:@"chat_send_nor"] forState:UIControlStateNormal];
    } else {
        self.icon.image = [UIImage imageNamed:@"Jobs"];
        [self.textButton setBackgroundImage:[UIImage imageNamed:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
    [self.textButton setTitle:message.text forState:UIControlStateNormal];
    self.time.text = message.time;
}

- (void)setCellFrame
{
    self.icon.frame = self.messageFrame.iconFrame;
    self.time.frame = self.messageFrame.timeFrame;
    self.textButton.frame = self.messageFrame.textFrame;
}

+ (MessageCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString* ID = @"Cell";
    MessageCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
//    [cell setBackgroundColor:[UIColor grayColor]];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
