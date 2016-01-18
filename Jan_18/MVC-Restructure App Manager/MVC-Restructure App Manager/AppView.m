//
//  AppView.m
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "AppView.h"
#import "AppInfo.h"
#import <UIKit/UIKit.h>

@interface AppView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *appName;
//@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@end

@implementation AppView

- (void)setInfo:(AppInfo *)info
{
    _info = info;
    self.iconView.image = info.image;
    self.appName.text = info.name;
}

- (IBAction)downloadClick:(UIButton *)button
{
    // 添加显示下载信息的label
    CGFloat w = 120;
    CGFloat h = 40;
    CGFloat x = self.superview.frame.size.width * 0.5 - w * 0.5;
    CGFloat y = self.superview.frame.size.height - 20 - h;
    UILabel* showDownloadInfo = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    // 设置背景颜色
    // colorWithWhite:1.0f alpha:0.2  第一个参数：0表示黑色，1表示白色。第二个参数表示透明度
    [showDownloadInfo setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.1]];

    // AppInfo* info = self.appList[button.tag];
    // 设置文字,字体，即显示方式
    showDownloadInfo.text = [NSString stringWithFormat:@"downloading\n%@", self.info.name];
    showDownloadInfo.numberOfLines = 0; // 不限行数，但需要高度够高
    showDownloadInfo.textAlignment = NSTextAlignmentCenter;
    showDownloadInfo.font = [UIFont systemFontOfSize:14];

    // 点击后应该让按钮无效。
    button.enabled = NO;

    // 设置动画让label渐近渐出, 采用了嵌套动画
    showDownloadInfo.alpha = 0.0; //先将透明度设为0
    [UIView animateWithDuration:1.0f animations:^{
        showDownloadInfo.alpha = 0.7; // 经过一秒后将透明度设为0.1
    } completion:^(BOOL finished){ // 动画结束之后的动作
        [UIView animateWithDuration:2.0f animations:^{
            showDownloadInfo.alpha = 0.0;
        }completion:^(BOOL finished){
            [showDownloadInfo removeFromSuperview];
        }];
    }];

    [self.superview addSubview:showDownloadInfo];
}

+ (instancetype)appView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"NibView" owner:nil options:nil] lastObject];
}

+ (instancetype)appViewWithAppInfo:(AppInfo *)info
{
    AppView* view = [self appView];
    view.info = info;
    return view;
}
@end
