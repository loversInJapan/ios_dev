//
//  ViewController.m
//  图片轮播器
//
//  Created by Jon_Snow on 1/24/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#define kImageH     130
#define kImageW     300
#define kImageCount   5

@interface ViewController () <UIScrollViewAccessibilityDelegate>

@property (strong, nonatomic) UIScrollView* scrollViewOfImages;
@property (strong, nonatomic) UIPageControl* pageController;
@property (strong, nonatomic) NSTimer* timerOfPages;

@end

@implementation ViewController

- (UIScrollView *)scrollViewOfImages
{
//    CGFloat y = (self.view.bounds.size.height - kImageH) * 0.5;
    if (_scrollViewOfImages == nil) {
        CGFloat x = (self.view.bounds.size.width - kImageW) * 0.5;
        _scrollViewOfImages = [[UIScrollView alloc] initWithFrame:CGRectMake(x, 50, kImageW, kImageH)];
        // 取消弹簧效果
        _scrollViewOfImages.bounces = NO;
        // 取消滑动条显示
        _scrollViewOfImages.showsHorizontalScrollIndicator = NO;
        // 设置内容大小
        _scrollViewOfImages.contentSize = CGSizeMake(kImageW*kImageCount, 0);
        // 分页
        _scrollViewOfImages.pagingEnabled = YES;
        // 添加到view中
        [self.view addSubview:_scrollViewOfImages];
        // 设置代理
        _scrollViewOfImages.delegate = self;
    }
    return _scrollViewOfImages;
}

- (UIPageControl *)pageController
{
    if (_pageController == nil) {
        // 分页控件本质上和scrollview没有任何关系，他们是两个独立的控件
        _pageController = [[UIPageControl alloc] init];
        // 总页数
        _pageController.numberOfPages = kImageCount;
        // 控制尺寸
        CGSize size = [_pageController sizeForNumberOfPages:kImageCount];
        _pageController.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageController.center = CGPointMake(self.scrollViewOfImages.center.x, self.scrollViewOfImages.center.y + 55);
        // 设置颜色
        _pageController.pageIndicatorTintColor = [UIColor greenColor];
        _pageController.currentPageIndicatorTintColor = [UIColor blackColor];

        // 添加到view
        [self.view addSubview:_pageController];

        // 添加监听方法
        /** 在oc中绝大多数控件都能监听UIControlEventValueChanged事件，button除外*/
        [_pageController addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageController;
}

- (void)pageChanged:(UIPageControl*)page
{
    int x = self.pageController.currentPage * self.scrollViewOfImages.bounds.size.width;
    [self.scrollViewOfImages setContentOffset:CGPointMake(x, 0) animated:YES];
}

#pragma mark - 设置scrollview的代理方法。
//当scrollview滑动停止时，获取当前页数修改PageControl的当前页
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获取contentOffSet的x
    CGFloat x = scrollView.contentOffset.x;
    int page = x / self.scrollViewOfImages.bounds.size.width;
    self.pageController.currentPage = page;
}

- (void)startTimer
{
    self.timerOfPages = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    // 问题：抓不住图片，无法停止滚动。  之前用schedul方法时，抓住图片久后，图片会连续滚动多张。
    // 我们想要的效果时，抓住图片时，timer停止，松开后，继续正常运行。
    [[NSRunLoop currentRunLoop] addTimer:self.timerOfPages forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    long i = self.pageController.currentPage + 1;
    self.pageController.currentPage = i % kImageCount;
    [self pageChanged:self.pageController];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 0; i < kImageCount; ++i) {
        // 添加图像视图
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.scrollViewOfImages.frame.size.width, 0, self.scrollViewOfImages.frame.size.width, self.scrollViewOfImages.frame.size.height)];
        // 添加图像
        NSString* nameOfImage = [NSString stringWithFormat:@"img_%02d", i+1];
        imageView.image = [UIImage imageNamed:nameOfImage];
        [self.scrollViewOfImages addSubview:imageView];
    }
    self.pageController.currentPage = 0;
//    [self pageChanged:self.pageController];
    [self startTimer];
}

// 开始抓住时，时钟停止
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timerOfPages invalidate];
}

// 松开后重启时钟
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
