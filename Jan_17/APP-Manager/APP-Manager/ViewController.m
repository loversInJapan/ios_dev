//
//  ViewController.m
//  APP-Manager
//
//  Created by Jon_Snow on 1/17/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray* appList;

@end

// 画九宫格界面
#define kRowCount  3    // 每一行子视图的个数
#define kAPPAmount 12   // 大视图中app显示个数
#define kViewW     65   // 一个子视图的宽
#define kViewH     110   // 一个子视图的高
//#define kMarginX      // 横向间隔
#define kMarginY   14   // 纵向间隔
#define kStartY    40   // 最开始的起始点的Y坐标

@implementation ViewController
// 懒加载app.plist
- (NSArray*)appList
{
    if (_appList == nil) {
        _appList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    }
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    int marginX = (self.view.frame.size.width - kRowCount*kViewW) / (kRowCount + 1);
    for (int i = 0; i < kAPPAmount; ++i) {
        int row = i / kRowCount; // 第几行
        int col = i % kRowCount; // 第几列
        CGFloat x = marginX + col*(kViewW + marginX); // 子视图的起始点x坐标
        CGFloat y = kStartY + kMarginY + row*(kViewH + kMarginY); // 子视图的起始点y坐标
        UIView* appView = [[UIView alloc] initWithFrame:CGRectMake(x, y, kViewW, kViewH)];
        //appView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:appView];

        // app视图内部实现
        // 1.添加UIImageView
        UIImageView* icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, appView.frame.size.width, 65)];
        icon.image = [UIImage imageNamed:[[self.appList objectAtIndex:i] objectForKey:@"icon"]];
        // 设置图像填充模式,等比例显示
        icon.contentMode = UIViewContentModeScaleAspectFill;
        [appView addSubview:icon];

        // 2.UILabel
        UILabel* desc = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame)+5, appView.frame.size.width, 10)]; // 与UIImageView之间留出5个像素的距离
        desc.text = [[self.appList objectAtIndex:i] objectForKey:@"name"];
        desc.textAlignment = NSTextAlignmentCenter;
        desc.font = [UIFont systemFontOfSize:10];
        [appView addSubview:desc];

        // 3.UIButton
        UIButton* download = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(desc.frame)+5, appView.frame.size.width, 25)];//与UILabel之间留出5个像素的距离
        [download setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [download setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [download setTitle:@"download" forState:UIControlStateNormal];
        [download setTitle:@"download" forState:UIControlStateHighlighted];
        // 按钮是有状态的，不同的状态可以对应不同的标题。但是按钮的字体是不区分状态的
        download.titleLabel.font = [UIFont systemFontOfSize:12];// 设置button中文本的字体
        // UIButton中的titleLabel是readonly的，表示这个指针不能改，但可以修改titleLabel所指的label中的内容
        [appView addSubview:download];

    }
}

@end
