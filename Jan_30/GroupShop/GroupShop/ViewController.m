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
#import "GroupShopFooterView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, GroupShopFooterViewDelegate>

@property (strong, nonatomic) NSMutableArray* groupShopList;

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
    // 从XIB加载footerView
    GroupShopFooterView* footer = [GroupShopFooterView footerView];
    // 设置分割线
    UIView* headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
    self.tableView.tableHeaderView = headerView;
    // 并设置代理
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
}

#pragma mark - footerView delegate method
- (void)loadMoreDidClickDownloadButton:(GroupShopFooterView *)view
{
    NSLog(@"正在努力加载中....");
    NSDictionary* dict = @{@"title":@"哈哈哈哈", @"icon":@"2010e3a0c7f88c3f5f5803bf66addd93.png", @"price":@"101.1", @"buyCount":@"999"};
    [self.groupShopList addObject:[GroupShopInfo groupShopWithDict:dict]];
    // 可以用［self.tableView reloadData],但这样做将重新加载全部的数据，但是我们并不需要。只需要执行插入一条新数据即可
    NSIndexPath* path = [NSIndexPath indexPathForRow:(self.groupShopList.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
}

#pragma mark - dataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupShopList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString* ID = @"Cell";
//
////    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    GroupShopCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
//
//    if (cell == nil) {
//        NSLog(@"load XIB");
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupShopCell" owner:nil options:nil] lastObject];
//    }

    // 传入tableView返回一个创建好的cell
    GroupShopCell* cell = [GroupShopCell cellWithTableView:tableView];

    // 将cell封装，让其包含一个cell信息模型的对象，然后把每个cell的信息传给它，就能帮我们设置好所有的属性
    cell.info = self.groupShopList[indexPath.row];

    
//    cell.textLabel.text = group.title;
//    cell.imageView.image = [UIImage imageNamed:group.icon];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"💲%@          %@人购买", group.price, group.buyCount];
    
    return cell;
}
@end
