//
//  GroupShopFooterView.m
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "GroupShopFooterView.h"

@interface GroupShopFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *footerViewLoadButton;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation GroupShopFooterView

- (IBAction)loadButton
{
    // 隐藏按钮
    self.footerViewLoadButton.hidden = YES;
    // 显示正在加载的视图
    self.loadingView.hidden = NO;
    // 多线程，GCD
    // 延迟执行大括号内的代码，这种方式效率高
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 这时需要从网络服务器加载数据，需要时间
        // view是用来显示数据的，但是这里改变了数据，有越权的行为。
        // 这里用代理实现比较好
        [self.delegate loadMoreDidClickDownloadButton:self];

        // 加载数据完成后
        self.footerViewLoadButton.hidden = NO;
        self.loadingView.hidden = YES;
    });
}

@end
