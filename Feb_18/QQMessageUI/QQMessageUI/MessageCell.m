//
//  MessageCell.m
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "MessageCell.h"
#import "MessageModel.h"

#define kTimeFont    10
#define kTextFont    14

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
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)time
{
    if (_time == nil) {
        _time = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 50)];
        _time.font = [UIFont systemFontOfSize:kTimeFont];
        [self.contentView addSubview:_time];
    }
    return _time;
}

- (UIButton *)textButton
{
    if (_textButton == nil) {
        _textButton = [[UIButton alloc] init];
        _textButton.frame = CGRectMake(0, 55, 300, 100);
        [_textButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_textButton];
    }
    return _textButton;
}

- (void)setMessage:(MessageModel *)message
{
    if (message.type == 0) {
        self.icon.image = [UIImage imageNamed:@"Jobs"];
        [self.textButton setBackgroundImage:[UIImage imageNamed:@"chat_recive_nor"] forState:UIControlStateNormal];
    } else {
        self.icon.image = [UIImage imageNamed:@"Gatsby"];
        [self.textButton setBackgroundImage:[UIImage imageNamed:@"chat_send_nor"] forState:UIControlStateNormal];
    }
    [self.textButton setTitle:message.text forState:UIControlStateNormal];
    self.time.text = message.time;
}

+ (MessageCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString* ID = @"Cell";
    MessageCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    [cell setBackgroundColor:[UIColor grayColor]];
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
