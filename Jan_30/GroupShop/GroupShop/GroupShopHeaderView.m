//
//  GroupShopHeaderView.m
//  GroupShop
//
//  Created by Jon_Snow on 2/12/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "GroupShopHeaderView.h"
#define kImages    5
//#define kImageH    145

@interface GroupShopHeaderView () <UIScrollViewAccessibilityDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (strong, nonatomic) NSTimer* timer;

@end

@implementation GroupShopHeaderView
- (void)setScrollViewContent
{
    CGFloat imageW = self.scrollView.frame.size.width;
    CGFloat imageH = self.scrollView.frame.size.height;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(imageW * kImages, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor blueColor];

    for (int i = 0; i < kImages; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageW * i, 0, imageW, imageH)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_%02d",i]];
        [self.scrollView addSubview:imageView];
    }

    self.pageController.numberOfPages = kImages;
    CGSize size = [self.pageController sizeForNumberOfPages:kImages];
    self.pageController.bounds = CGRectMake(0, 0, size.width, size.height);
    self.pageController.center = CGPointMake(self.scrollView.center.x, CGRectGetMaxY(self.scrollView.frame)-10);
    
    [self startTimer];
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    long i = self.pageController.currentPage + 1;
    self.pageController.currentPage = i % self.pageController.numberOfPages;
    [self changePage:self.pageController];
}

- (void)changePage:(UIPageControl*)page
{
    long x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

//#pragma mark - scroll view delegate methods implement
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    [self.timer invalidate];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    [self startTimer];
//}

+ (instancetype)loadHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
}

@end
