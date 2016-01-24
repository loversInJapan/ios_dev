//
//  ViewController.m
//  UIScrollView
//
//  Created by Jon_Snow on 1/22/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *minionScroll;
@property (strong, nonatomic) UIImageView* imageView;

//假设图像是从网络上获取的
@property (strong, nonatomic) UIImage* image;

@end

@implementation ViewController
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [self.minionScroll addSubview:_imageView];
    }
    return _imageView;
}
- (void)setImage:(UIImage *)image
{
    _image = image;

    // 设置图像视图的内容
    self.imageView.image = image;
    // 让图像视图根据图像大小自动调整大小
    [self.imageView sizeToFit];
    // 告诉scrollview内部内容的实际大小
    self.minionScroll.contentSize = image.size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.minionScroll.contentSize = CGSizeMake(892, 632);
    // 设置图像
    self.image = [UIImage imageNamed:@"minion"];
    // 设置边距
    self.minionScroll.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    // 不显示垂直和水平滚动表示
    self.minionScroll.showsHorizontalScrollIndicator = NO;
    self.minionScroll.showsVerticalScrollIndicator = NO;
    // 取消弹簧效果
    self.minionScroll.bounces = NO;
    // 设置offset
    self.minionScroll.contentOffset = CGPointMake(0,0);


    /**
     实现两点触屏的图片放大和缩小
     1）设置代理
     2）指定最大／最小缩放比例
     */
    self.minionScroll.delegate = self;
    // 设置最大／最小缩放比例
    self.minionScroll.maximumZoomScale = 2.0;
    self.minionScroll.minimumZoomScale = 0.2;

    UIButton* button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    // 添加到scrollview中，按钮会随图片scrollview而动
    [self.view addSubview:button];
}

#pragma mark - UIScrollView的代理方法
// 代理方法的返回值就是告诉scrollView要缩放的视图是谁，具体的缩放实现由scrollview来完成
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)click
{
    CGPoint contentOffset = self.minionScroll.contentOffset;
    contentOffset.x += 20;
    contentOffset.y += 20;
    self.minionScroll.contentOffset = contentOffset;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
