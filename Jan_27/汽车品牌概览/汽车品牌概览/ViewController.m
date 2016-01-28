//
//  ViewController.m
//  汽车品牌概览
//
//  Created by Jon_Snow on 1/28/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "carsGroup.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSArray* carsGroup;

@end

@implementation ViewController
#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)carsGroup
{
    if (_carsGroup == nil) {
        _carsGroup = [carsGroup carsGroupList];
    }
    return _carsGroup;
}

#pragma mark - 数据源协议实现
// 分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"%ld", self.carsGroup.count);
    return self.carsGroup.count;
}

// 每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    carsGroup* group = self.carsGroup[section];
    return group.cars.count;
}

// 每行的cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    carsGroup* group = self.carsGroup[indexPath.section];
    car* car = group.cars[indexPath.row];
    // 从缓存池中查找所要的cell
    static NSString* ID = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}
// 分组的头部
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    carsGroup* group = self.carsGroup[section];
    return group.title;
}

// 右侧的索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // 索引数组中的"内容"，跟分组无关
    // 索引数组中的下标，对应的是分组的下标
//    NSMutableArray* array = [NSMutableArray array];
//    for (carsGroup* group in self.carsGroup) {
//        [array addObject:group.title];
//    }
//    return array;

    // KVC是cocoa的大招
    // 用来间接获取或者修改对象属性的方式
    // 使用KVC在获取数值时，如果指定对象不包含keyPath的"键名"，会自动进入对象的内部查找
    // 如果取值的对象是一个数组，同样返回一个数组
    NSArray *array = [self.carsGroup valueForKeyPath:@"cars.name"];
    NSLog(@"%@", array);

    return [self.carsGroup valueForKeyPath:@"title"];
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
