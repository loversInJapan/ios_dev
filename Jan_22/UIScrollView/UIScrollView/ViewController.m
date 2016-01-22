//
//  ViewController.m
//  UIScrollView
//
//  Created by Jon_Snow on 1/22/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
    self.image = [UIImage imageNamed:@"minion"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
