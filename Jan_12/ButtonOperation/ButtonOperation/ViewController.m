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

#define kMovingDelta 20;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButtom;

@end

@implementation ViewController
// 提示：可以通过center来改变位置
// 加载完成被调用
// 代码创建按钮
- (void)viewDidLoad
{
    // 千万不要忘记调用父类的实现方法
    [super viewDidLoad];

    // 使用alloc init方法实例化的按钮就是custom类型的，按钮的类型一旦指定就不能修改
    // 创建其他类型的按钮
    UIButton* bnt = [UIButton buttonWithType:UIButtonTypeInfoLight];
    bnt.center = CGPointMake(50, 50);
    [self.view addSubview:bnt];
    // 创建按钮，并指定其位置
    UIButton* myButton = [[UIButton alloc] initWithFrame:CGRectMake(137, 200, 100, 100)];
    // 将创建出来的button赋值给iconButtom,即表示将各个操作按钮与此按钮链接，即可以移动，缩放此按钮
    self.iconButtom = myButton;

    // 设置按钮背景颜色
    myButton.backgroundColor = [UIColor groupTableViewBackgroundColor];

    // 添加背景图片
    [myButton setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    [myButton setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];

    // 添加按钮文字
    [myButton setTitle:@"click me" forState:UIControlStateNormal];
    [myButton setTitle:@"HeiHei" forState:UIControlStateHighlighted];

    // 设置文字颜色
    [myButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];

    // 设置文字的对齐方式
    myButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;

    // 将按钮添加到视图
    [self.view addSubview:myButton];
}


#pragma mark - button operation
// 代码优化，利用move函数代替4个函数
- (IBAction)move:(UIButton *)button
{
    // 利用transform属性来改变按钮位置
    // CGAffineTransformMakeTranslation的位移形变式相对按钮初始位置来变化的，即无法对按钮的上一次形变进行累加，但另一个函数CGAffineTransformTranslate却可以对形变累加
    CGFloat dx, dy;
    switch (button.tag) {
        case kMovingUp: // 用枚举代替tag
            dy -= kMovingDelta;
            break;
        case kMovingDown:
            dy += kMovingDelta;
            break;
        case kMovingLeft:
            dx -= kMovingDelta;
            break;
        case kMovingRight:
            dx += kMovingDelta;
            break;
    }

    self.iconButtom.transform = CGAffineTransformTranslate(self.iconButtom.transform, dx, dy);
    NSLog(@"%@", NSStringFromCGAffineTransform(self.iconButtom.transform));
}


// frame属性一般用来实例化控件的初始位置，其他情况下不应轻易修改
- (void)moveWithFrame:(UIButton*)button
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
//    CGRect bounds = self.iconButtom.bounds;
//    if (button.tag) {
//        bounds.size.height += 50;
//        bounds.size.width += 50;
//    }else{
//        bounds.size.height -= 50;
//        bounds.size.width -= 50;
//    }

    //制作首尾式动画
    // 1.准备开始一个动画
    [UIView beginAnimations:nil context:nil]; 
    // 2.修改控件属性
    //self.iconButtom.bounds = bounds;

    // 通过transform属性来放大和缩小
    CGFloat scale = (button.tag) ? 1.2 : 0.8; // 放大的倍数
    self.iconButtom.transform = CGAffineTransformScale(self.iconButtom.transform, scale, scale);


    // 设置动画执行的时间
    [UIView setAnimationDuration:3]; //动画执行并不会变慢，why？

    // 3.提交动画
    [UIView commitAnimations];
}

// 旋转
- (IBAction)rotate:(UIButton *)button
{
    // 在OC中，关于角度统一使用弧度值丈量，逆时针为负值，顺时针为正值
    // 180度 ＝ M_PI
    CGFloat angle = (button.tag) ? M_PI_2 : -M_PI_2;
    self.iconButtom.transform = CGAffineTransformRotate(self.iconButtom.transform, angle);
}
@end
