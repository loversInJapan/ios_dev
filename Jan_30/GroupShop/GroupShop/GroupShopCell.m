//
//  GroupShopCell.m
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "GroupShopCell.h"
#import "GroupShopInfo.h"

@interface GroupShopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@end

@implementation GroupShopCell
+ (GroupShopCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString* ID = @"Cell";
    GroupShopCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        NSLog(@"load XIB");
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupShopCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setInfo:(GroupShopInfo *)info
{
    _info = info;
    self.iconView.image = [UIImage imageNamed:info.icon];
    self.titleLabel.text = info.title;
    self.priceLabel.text = [NSString stringWithFormat:@"💲%@", info.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"已有%@人购买", info.buyCount];
}

#pragma mark - 模板提供的方法
/**
 初始化方法
 使用代码创建Cell的时候会被调用，如果使用XIB或者Storyboard，此方法不会被调用
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}

/**
 从XIB被加载之后，会自动被调用，如果使用纯代码，不会被执行
 */
- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s", __func__);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        self.contentView.backgroundColor = [UIColor redColor];
    }else{
        self.contentView.backgroundColor = [UIColor greenColor];
    }
}

@end
