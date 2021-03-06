//
//  ViewController.m
//  PhotoViewer
//
//  Created by Jon_Snow on 1/14/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

typedef enum ButtonDir
{
    LeftButton = -1,
    RightButton = 1
}kButtonDir;

@interface ViewController ()

/**
 *控件
 如果是用storyboard拖线，控件用weak
 如果用代码创建界面，使用copy
 ＊自定义对象使用strong
 ＊NSString使用copy
 ＊数字型的使用assign
 */
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UIImageView* iconImage;
@property (nonatomic, strong) UIButton* leftButton;
@property (nonatomic, strong) UIButton* rightButton;
@property (nonatomic, strong) UILabel* textLabel;
// 指示第几张图片
@property (nonatomic, assign) int index;
@property (nonatomic, strong) NSArray* photoArray;

@end

/**
 代码搭建界面的步骤：
 1.确定界面元素
 2.代码实现布局
 3.写代码
 */
@implementation ViewController
/* 
 懒加载（延迟加载）：通过getter实现
 效果：让对象在最需要的时候才创建
 */
- (NSArray *)photoArray
{
    // bundle成为包，[NSBundle mainBundle]编译安装之后对应的程序包
    if (_photoArray == nil) {
//        NSDictionary* dict1 = @{@"name":@"biaoqingdi", @"text":@"biaodingdi1"};
//        NSDictionary* dict2 = @{@"name":@"bingli", @"text":@"bingli1"};
//        NSDictionary* dict3 = @{@"name":@"chiniupa", @"text":@"chiniupa1"};
//        NSDictionary* dict4 = @{@"name":@"danteng", @"text":@"danteng1"};
//        NSDictionary* dict5 = @{@"name":@"wangba", @"text":@"wangba"};
//
//        _photoArray = @[dict1,dict2,dict3,dict4,dict5];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"PhotoArray" ofType:@"plist"];
        //NSLog(@"%@",path);
        // OC中ContentsOfFile，通常需要完整的路径
        _photoArray = [NSArray arrayWithContentsOfFile:path];
    }
    return _photoArray;
}

/**
 懒加载控件处理
 用getter方法还是直接访问属性的一个很大的使用技巧是，用在控件无关处使用getter能够降低耦合度，不必在乎谁先创建。
 */
- (UILabel *)numberLabel  // getter里面不能调用self.getter方法，会死循环
{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.frame = CGRectMake(0, 40, self.view.frame.size.width, 20);
        // _numberLabel.text = @"1 / 5";
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_numberLabel];
    }
    return _numberLabel;
}

- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        CGFloat imageW = 200;
        CGFloat imageH = 200;
        CGFloat imageX = (self.view.frame.size.width - 200) * 0.5;
        CGFloat imageY = CGRectGetMaxY(self.numberLabel.frame) + 10;
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        //_iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
        [self.view addSubview:_iconImage];
    }
    return _iconImage;
}

- (UIButton*)buttonContent:(UIButton*)button WithDir:(kButtonDir)dir
{
    NSString* dirString = dir > 0 ? @"right" : @"left";
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",dirString]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",dirString]] forState:UIControlStateHighlighted];

    button.tag = dir;
    // 增加按钮监听
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    return button;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat leftCenterX = self.iconImage.frame.origin.x * 0.5;
        CGFloat leftCenterY = self.iconImage.center.y;
        _leftButton.center = CGPointMake(leftCenterX, leftCenterY);
        kButtonDir left = LeftButton;
        _leftButton = [self buttonContent:_leftButton WithDir:left];
//        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
//        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
//
//        _leftButton.tag = -1;
//        // 增加按钮监听
//        [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_leftButton];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat leftCenterX = self.leftButton.center.x;
        CGFloat rightCenterX = self.view.frame.size.width - leftCenterX;
        CGFloat rightCenterY = _iconImage.center.y;
        _rightButton.center = CGPointMake(rightCenterX, rightCenterY);
        kButtonDir right = RightButton;
        _rightButton = [self buttonContent:_rightButton WithDir:right];
//        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
//        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
//        _rightButton.tag = 1;
//        // 增加按钮监听
//        [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_rightButton];
    }
    return _rightButton;
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.iconImage.frame)+10, self.view.frame.size.width, 20)];
        //_textLabel.text = @"what a funny look";
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor redColor];
        // 需要Lable有足够的高度，这样设置就不限制行数。
        _textLabel.numberOfLines = 0;
        [self.view addSubview:_textLabel];
    }
    return _textLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.图片序号展示
    // 2.图片加载
    // 3.添加左按钮
    // 4.添加右边按钮
    // 5.添加文字
    [self showPhoto];
    // 问题二，[self showPhoto];必须在放在相片数组加载之后，导致限制太大。因此使用OC的懒加载机制解决
//    NSDictionary* dict1 = @{@"name":@"biaoqingdi", @"text":@"biaodingdi1"};
//    NSDictionary* dict2 = @{@"name":@"bingli", @"text":@"bingli1"};
//    NSDictionary* dict3 = @{@"name":@"chiniupa", @"text":@"chiniupa1"};
//    NSDictionary* dict4 = @{@"name":@"danteng", @"text":@"danteng1"};
//    NSDictionary* dict5 = @{@"name":@"wangba", @"text":@"wangba"};
//
//    self.photoArray = @[dict1,dict2,dict3,dict4,dict5];
//
}

- (void)clickButton:(UIButton*) button
{
    self.index += (int)button.tag;
    [self showPhoto];
}

- (void)showPhoto
{
    // 用数组和字典保存图片信息
//    NSDictionary* dict1 = @{@"name":@"biaoqingdi", @"text":@"biaodingdi1"};
//    NSDictionary* dict2 = @{@"name":@"bingli", @"text":@"bingli1"};
//    NSDictionary* dict3 = @{@"name":@"chiniupa", @"text":@"chiniupa1"};
//    NSDictionary* dict4 = @{@"name":@"danteng", @"text":@"danteng1"};
//    NSDictionary* dict5 = @{@"name":@"wangba", @"text":@"wangba"};
//
//    NSArray* photoArray = @[dict1,dict2,dict3,dict4,dict5]; // 问题一，每次调用showPhoto函数都要重新创建并加载数组。因此将图片数组作为属性保存

    self.iconImage.image = [UIImage imageNamed:self.photoArray[self.index][@"name"]];
    self.textLabel.text = self.photoArray[self.index][@"text"];

    self.numberLabel.text = [NSString stringWithFormat:@"%u/%lu", self.index + 1, (unsigned long)self.photoArray.count];
//    switch (self.index) {
//        case 0:
//            self.iconImage.image = [UIImage imageNamed:@"biaoqingdi"];
//            self.textLabel.text = @"biaoqingdi";
//            break;
//        case 1:
//            self.iconImage.image = [UIImage imageNamed:@"bingli"];
//            self.textLabel.text = @"bingli";
//            break;
//        case 2:
//            self.iconImage.image = [UIImage imageNamed:@"chiniupa"];
//            self.textLabel.text = @"chiniupa";
//            break;
//        case 3:
//            self.iconImage.image = [UIImage imageNamed:@"danteng"];
//            self.textLabel.text = @"danteng";
//            break;
//        case 4:
//            self.iconImage.image = [UIImage imageNamed:@"wangba"];
//            self.textLabel.text = @"wangba";
//            break;
//    }
    self.leftButton.enabled = (self.index != 0);
    self.rightButton.enabled = (self.index != 4);
        /**
     这里无论先创建谁都可以，先创建右按钮的话，则在右按钮创建的过程中会创建左按钮
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
