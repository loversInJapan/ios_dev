//
//  ViewController.m
//  UITableView_基础
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "GOTData.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 数据数组
@property (strong, nonatomic) NSArray* gameOfThrone;
@end

#pragma mark - 数据源方法
@implementation ViewController
- (NSArray *)gameOfThrone
{
    if (_gameOfThrone == nil) {
        GOTData* season1 = [[GOTData alloc] init];
        season1.title = @"game of throne season 1";
        season1.footer = @"season 1 ended";
        NSMutableArray* episodes = [NSMutableArray array];
        for (int i = 0; i < 15; ++i) {
            [episodes addObject:[NSString stringWithFormat:@"%@-episode %02d",season1.title, i+1]];
        }
        season1.episodes = episodes;

        GOTData* season2 = [[GOTData alloc] init];
        season2.title = @"game of throne season 2";
        season2.footer = @"season 2 ended";
        episodes = [NSMutableArray array];
        for (int i = 0; i < 20; ++i) {
            [episodes addObject:[NSString stringWithFormat:@"%@-episode %02d",season2.title, i+1]];
        }
        season2.episodes = episodes;
        _gameOfThrone = @[season1,season2];
    }
    return _gameOfThrone;
}
// 分组组数，如果没有实现，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.gameOfThrone.count;
}
// 每组中的单元的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.gameOfThrone objectAtIndex:section] episodes] count];
}

// 设置每组中的单元的属性
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    GOTData* data = self.gameOfThrone[indexPath.section];
    cell.textLabel.text = data.episodes[indexPath.row];
    return cell;
}

// 设置每组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.gameOfThrone[section] title]; // 用点语法不行，因为从数组中去出的数据都是ID类型的
}

// 设置每组脚页
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [self.gameOfThrone[section] footer];
}
@end
