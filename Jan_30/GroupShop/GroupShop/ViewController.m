//
//  ViewController.m
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "GroupShopInfo.h"
#import "GroupShopCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray* groupShopList;
@end

@implementation ViewController
- (NSArray *)groupShopList
{
    if (_groupShopList == nil) {
        _groupShopList = [GroupShopInfo groupShopList];
    }
    return _groupShopList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    // 设置边界宽度
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}

#pragma mark - dataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupShopList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ID = @"Cell";

//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    GroupShopCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        NSLog(@"load XIB");
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupShopCell" owner:nil options:nil] lastObject];
    }

    GroupShopInfo* group = self.groupShopList[indexPath.row];
//    cell.textLabel.text = group.title;
//    cell.imageView.image = [UIImage imageNamed:group.icon];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"💲%@          %@人购买", group.price, group.buyCount];
    cell.iconView.image = [UIImage imageNamed:group.icon];
    cell.titleLabel.text = group.title;
    cell.priceLabel.text = [NSString stringWithFormat:@"💲%@", group.price];
    cell.buyCountLabel.text = [NSString stringWithFormat:@"已有%@人购买", group.buyCount];
    return cell;
}
@end
