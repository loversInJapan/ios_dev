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

@interface ViewController () <AppViewDelegate>

@property (nonatomic, strong) NSArray* appList;
@property (strong, nonatomic) UILabel* showDownloadInfo;

@end

@implementation ViewController
- (NSArray *)appList
{
    if (_appList == nil) {
        _appList = [AppInfo appList]; // 获取app信息列表
    }
    return _appList;
}

- (UILabel *)showDownloadInfo
{
    if (_showDownloadInfo == nil) {
        // 添加显示下载信息的label
        CGFloat w = 120;
        CGFloat h = 40;
        CGFloat x = self.view.frame.size.width * 0.5 - w * 0.5;
        CGFloat y = self.view.frame.size.height - 20 - h;
        _showDownloadInfo = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        // 设置背景颜色
        // colorWithWhite:1.0f alpha:0.2  第一个参数：0表示黑色，1表示白色。第二个参数表示透明度
        [_showDownloadInfo setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.1]];

        // AppInfo* info = self.appList[button.tag];
        // 设置文字,字体，即显示方式
        _showDownloadInfo.numberOfLines = 0; // 不限行数，但需要高度够高
        _showDownloadInfo.textAlignment = NSTextAlignmentCenter;
        _showDownloadInfo.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:_showDownloadInfo];
    }
    return _showDownloadInfo;
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

        // 添加代理
        appView.delegate = self;
        // 确定视图的位置
        appView.frame = CGRectMake(x, y, kViewW, kViewH);
        [self.view addSubview:appView];
        // 实现视图内部细节
//        appView.info = self.appList[i];
    }
}

#pragma mark - 实现代理方法
- (void)appViewDidClickDownloadButton:(AppView *)appView
{
    self.showDownloadInfo.text = [NSString stringWithFormat:@"downloading\n%@", appView.info.name];
    // 设置动画让label渐近渐出, 采用了嵌套动画
    self.showDownloadInfo.alpha = 0.0; //先将透明度设为0
    [UIView animateWithDuration:1.0f animations:^{
        self.showDownloadInfo.alpha = 0.7; // 经过一秒后将透明度设为0.1
    } completion:^(BOOL finished){ // 动画结束之后的动作
        [UIView animateWithDuration:2.0f animations:^{
            self.showDownloadInfo.alpha = 0.0;
        }completion:^(BOOL finished){
        }];
    }];
}
@end
