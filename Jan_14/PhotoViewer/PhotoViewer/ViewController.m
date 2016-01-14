//
//  ViewController.m
//  PhotoViewer
//
//  Created by Jon_Snow on 1/14/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UIImageView* iconImage;
@property (nonatomic, strong) UIButton* leftButton;
@property (nonatomic, strong) UIButton* rightButton;
@property (nonatomic, strong) UILabel* textLabel;
// 指示第几张图片
@property (nonatomic, assign) int index;

@end

/**
 代码搭建界面的步骤：
 1.确定界面元素
 2.代码实现布局
 3.写代码
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //图片序号展示
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.frame = CGRectMake(0, 40, self.view.frame.size.width, 20);
    // _numberLabel.text = @"1 / 5";
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_numberLabel];

    //图片加载
    CGFloat imageW = 200;
    CGFloat imageH = 200;
    CGFloat imageX = (self.view.frame.size.width - 200) * 0.5;
    CGFloat imageY = CGRectGetMaxY(_numberLabel.frame) + 10;
    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    //_iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
    [self.view addSubview:_iconImage];

    // 添加左按钮
    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    CGFloat leftCenterX = _iconImage.frame.origin.x * 0.5;
    CGFloat leftCenterY = _iconImage.center.y;
    _leftButton.center = CGPointMake(leftCenterX, leftCenterY);
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:_leftButton];

    _leftButton.tag = -1;
    // 增加按钮监听
    [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    // 添加右边按钮
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    CGFloat rightCenterX = self.view.frame.size.width - leftCenterX;
    CGFloat rightCenterY = _iconImage.center.y;
    _rightButton.center = CGPointMake(rightCenterX, rightCenterY);
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:_rightButton];
    _rightButton.tag = 1;
    // 增加按钮监听
    [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    // 添加文字
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconImage.frame)+10, self.view.frame.size.width, 20)];
    //_textLabel.text = @"what a funny look";
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.textColor = [UIColor redColor];
    [self.view addSubview:_textLabel];

    [self showPhoto];
}

- (void)clickButton:(UIButton*) button
{
    self.index += (int)button.tag;
    [self showPhoto];
}
- (void)showPhoto
{
    self.numberLabel.text = [NSString stringWithFormat:@"%u/%u", self.index + 1, 5];
    switch (self.index) {
        case 0:
            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
            self.textLabel.text = @"biaoqingdi";
            break;
        case 1:
            self.iconImage.image = [UIImage imageNamed:@"bingli"];
            self.textLabel.text = @"bingli";
            break;
        case 2:
            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
            self.textLabel.text = @"chiniupa";
            break;
        case 3:
            self.iconImage.image = [UIImage imageNamed:@"danteng"];
            self.textLabel.text = @"danteng";
            break;
        case 4:
            self.iconImage.image = [UIImage imageNamed:@"wangba"];
            self.textLabel.text = @"wangba";
            break;
    }
    self.leftButton.enabled = (self.index != 0);
    self.rightButton.enabled = (self.index != 4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
