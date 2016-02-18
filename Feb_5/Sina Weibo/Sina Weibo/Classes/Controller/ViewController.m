//
//  ViewController.m
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
//#import "Statuses.h"
#import "StatusCellTableViewCell.h"
#import "StatusFrame.h"

static NSString* ID = @"Cell";

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSArray* statusFrames;

@end

@implementation ViewController
// 懒加载
- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [StatusFrame statusFrames];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // 为tableView注册可重用单元格
    [self.tableView registerClass:[StatusCellTableViewCell class] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     在Storyboard中指定了可重用标示符，同时指定了Cell的类是HMStatusCell

     系统会为tableView注册一个原形Cell，专门用来做可重用单元格的，一旦缓冲区中不存在
     可重用单元格，系统会使用原形Cell新实例化一个Cell用程序使用！

     因此如果在，Storyboard中，注册了原形Cell，就不再需要 cell == nil的判断了
     */
    //    HMStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // unable to dequeue a cell with identifier Cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard
    // 使用这个方法，要求一定注册可重用单元格，否则就会崩溃！
    // 官方建议使用以下方法，利用程序的崩溃，及时发现问题
    StatusCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
//    StatusCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 一旦在注册了可重用Cell，以上两个方法是等价的
//    if (cell == nil) {
//        cell = [[StatusCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }

    StatusFrame* cellframe = self.statusFrames[indexPath.row];
    cell.cellFrame = cellframe;
//    cell.textLabel.text = cell.status.name;
    return cell;
}

#pragma mark - 代理方法
/** 计算单元格行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     计算行高的方法，会在加载表格数据时，有多少行计算多少次 contentSize

     问题：此方法执行的时候，cell还没有被实例化！
     但是：行高计算是在实例化cell时，通过设置status属性，计算的=>有了status模型，就可以知道行高！

     问题：如何在cell实例化之前，获得行高？
     解决方法：通过status可以计算得到行高！=》再建立一个模型，专门计算所有控件的位置
     */
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];

    return statusFrame.cellHeight;
}

@end
