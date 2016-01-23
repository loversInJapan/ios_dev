//
//  ViewController.m
//  喜马拉雅
//
//  Created by Jon_Snow on 1/23/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *showMyself;

@end

@implementation ViewController
/**
 contentSize 会根据边距调整offset
 contentInset 不会调整offset
*/

/**
 系统加载了main.storyboard后，给scrollview对象进行赋值，然后scrollview的set方法将被调用
 */
- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    // 设置边距
    self.scrollView.contentInset = UIEdgeInsetsMake(59, 0, 0, 0);
    // 设置contentSize
    CGFloat h = self.scrollView.frame.size.height + 85 + 49;
    self.scrollView.contentSize = CGSizeMake(0, h);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
