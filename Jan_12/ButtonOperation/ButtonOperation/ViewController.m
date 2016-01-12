//
//  ViewController.m
//  ButtonOperation
//
//  Created by Jon_Snow on 1/12/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

// 枚举类型是解决魔法数字比较常用的手段。magic number是指开发中很令人费解的数字。
typedef enum {
    kMovingUp = 10,
    kMovingDown,
    kMovingLeft,
    kMovingRight,
}kMovingDir;

#define kMovingDelta 10;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButtom;

@end

// 代码优化，利用move函数代替4个函数

// 提示：可以通过center来改变位置
@implementation ViewController
- (IBAction)move:(UIButton *)button
{
    CGRect rect = self.iconButtom.frame;
    switch (button.tag) {
        case kMovingUp: // 用枚举代替tag
            rect.origin.y -= kMovingDelta;
            break;
        case kMovingDown:
            rect.origin.y += kMovingDelta;
            break;
        case kMovingLeft:
            rect.origin.x -= kMovingDelta;
            break;
        case kMovingRight:
            rect.origin.x += kMovingDelta;
            break;
    }
    // rect.origin.y -= 10;
    self.iconButtom.frame = rect;
}

- (IBAction)upward
{
    //  将图片上移10个像素，但OC不允许直接改变属性中的结构体成员变量里的成员，因此下边的语句错误
    //self.iconButtom.frame.origin.y -= 10;
    CGRect rect = self.iconButtom.frame;
    rect.origin.y -= 10;
    self.iconButtom.frame = rect;
}

- (IBAction)downward
{
    CGRect rect = self.iconButtom.frame;
    rect.origin.y += 10;
    self.iconButtom.frame = rect;
}

- (IBAction)leftward
{
    CGRect rect = self.iconButtom.frame;
    rect.origin.x -= 10;
    self.iconButtom.frame = rect;
}

- (IBAction)rightward
{
    CGRect rect = self.iconButtom.frame;
    rect.origin.x += 10;
    self.iconButtom.frame = rect;
}

// 通过frame放大和缩小, 将放大按钮的tag设置成1，缩小按钮的tag设置成0
- (IBAction)zoomWithFrame:(UIButton *)button
{
    CGRect frame = self.iconButtom.frame;
    if (button.tag) {
        frame.size.height += 10;
        frame.size.width += 10;
    }else{
        frame.size.height -= 10;
        frame.size.width -= 10;
    }
    self.iconButtom.frame = frame;
}

// 通过bounds来放大缩小， tag设置如上
- (IBAction)zoomWithBounds:(UIButton *)button
{
    CGRect bounds = self.iconButtom.bounds;
    if (button.tag) {
        bounds.size.height += 50;
        bounds.size.width += 50;
    }else{
        bounds.size.height -= 50;
        bounds.size.width -= 50;
    }

    //制作首尾式动画
    // 1.准备开始一个动画
    [UIView beginAnimations:nil context:nil];

    // 2.修改控件属性
    self.iconButtom.bounds = bounds;

    // 设置动画执行的时间
    [UIView setAnimationDuration:3]; //动画执行并不会变慢，why？

    // 3.提交动画
    [UIView commitAnimations];
}

@end
