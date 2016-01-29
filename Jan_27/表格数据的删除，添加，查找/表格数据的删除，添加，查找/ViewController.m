//
//  ViewController.m
//  表格数据的删除，添加，查找
//
//  Created by Jon_Snow on 1/29/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSMutableArray* dataList;

@end

@implementation ViewController
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",@"zhangsan",@"lisi",@"wangwu",nil];
    }
    return _dataList;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ID = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

// 右划单元格出现删除字样,但删除动作需要自己定义
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"delete");
        NSLog(@"%@", self.dataList);
        //在MVC中，数据是保存在模型中的
        // 1. 删除datalist中indexpath对应的数据
        [self.dataList removeObjectAtIndex:indexPath.row];
        // 2. 刷新表格
        // 全部数据重载
//        [self.tableView reloadData];
        //动画删除指定行，效率更高
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }else if (editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"insert");
        // 1.向数组添加数据

        [self.dataList insertObject:@"hahahaha" atIndex:indexPath.row+1];
        // 2.刷新表格
        NSIndexPath* path = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        NSLog(@"%@",self.dataList);
//        path.row += 1;
    }
}

//移动单元行,只要实现此方法，就能拖动单元行
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 调整数据
    // 1.取出源数据
    id source = self.dataList[sourceIndexPath.row];
    // 2.删除源数据
    [self.dataList removeObjectAtIndex:sourceIndexPath.row];
    // 3.插入到目标行
    [self.dataList insertObject:source atIndex:destinationIndexPath.row];
    NSLog(@"%@",self.dataList);
}
// 表格插入方法定义在 UITableViewDelegate协议中
// 返回编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    // self.tableView.editing = YES默认开启删除模式
    self.tableView.editing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
