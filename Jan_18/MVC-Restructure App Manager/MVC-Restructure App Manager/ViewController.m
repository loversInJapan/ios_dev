//
//  ViewController.m
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppView.h"

#define kRowCount  3    // 每一行子视图的个数
#define kAPPAmount 12   // 大视图中app显示个数
#define kMarginY   18   // 纵向间隔
#define kStartY    40   // 最开始的起始点的Y坐标
#define kViewW     65   // 一个子视图的宽
#define kViewH     110   // 一个子视图的高

@interface ViewController ()

@property (nonatomic, strong) NSArray* appList;

@end

@implementation ViewController
- (NSArray *)appList
{
    if (_appList == nil) {
        _appList = [AppInfo appList]; // 获取app信息列表
    }
    return _appList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    int marginX = (self.view.frame.size.width - kRowCount*kViewW) / (kRowCount + 1);
    for (int i = 0; i < self.appList.count; ++i) {
        int row = i / kRowCount;
        int col = i % kRowCount;
        CGFloat x = marginX + col*(kViewW + marginX); // 子视图的起始点x坐标
        CGFloat y = kStartY + kMarginY + row*(kViewH + kMarginY); // 子视图的起始点y坐标

        // 加载由XIB定义的自定义视图
        AppView* appView = [AppView appViewWithAppInfo:self.appList[i]];
        // 确定视图的位置
        appView.frame = CGRectMake(x, y, kViewW, kViewH);
        [self.view addSubview:appView];
        // 实现视图内部细节
//        appView.info = self.appList[i];
    }
}


@end
