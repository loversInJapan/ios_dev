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
        self.footerViewLoadButton.hidden = NO;
        self.loadingView.hidden = YES;
    });
}

@end
