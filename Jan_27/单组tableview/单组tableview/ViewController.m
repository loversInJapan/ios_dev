//
//  ViewController.m
//  单组tableview
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "LOLHeros.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSArray* heros;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain]; // 必须指定style，也就是只能用这个方法初始化
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSArray *)heros
{
    if (_heros == nil) {
        _heros = [LOLHeros herosList];
    }
    return _heros;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    LOLHeros* hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
