//
//  ViewController.m
//  TomCat
//
//  Created by Jon_Snow on 1/16/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

// 序列帧动画：顺序播放一组图片
@implementation ViewController
/**
 重构－－抽取代码
 1）将重复代码复制到新的方法中
 2）根据需要调整参数
 */

- (void)tomAnimationWithName:(NSString*)name AndImageAmount:(NSInteger)count
{
    if ([self.tom isAnimating]) {
        return;
    } // 如果动画正在执行，则返回

    NSMutableArray* imageArray = [NSMutableArray array];
    for (int i = 0; i < count; ++i) {
        NSString* imageName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i]; // 02表示显示2位数，不够前面补零
        UIImage* image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    self.tom.animationImages = imageArray; // 添加动画数组
    self.tom.animationRepeatCount = 1; // 动画重复次数，默认为0，0代表不断重复
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;// 设置动画执行时间
    [self.tom startAnimating];// 开始动画
}

- (IBAction)eatABird
{
    [self tomAnimationWithName:@"eat" AndImageAmount:40];
//    NSMutableArray* imageArray = [NSMutableArray array];
//    for (int i = 0; i < 40; ++i) {
//        NSString* imageName = [NSString stringWithFormat:@"eat_%02d.jpg", i]; // 02表示显示2位数，不够前面补零
//        UIImage* image = [UIImage imageNamed:imageName];
//        [imageArray addObject:image];
//    }
//    self.tom.animationImages = imageArray; // 添加动画数组
//    self.tom.animationRepeatCount = 1; // 动画重复次数，默认为0，0代表不断重复
//    self.tom.animationDuration = self.tom.animationImages.count * 0.075;// 设置动画执行时间
//    [self.tom startAnimating];// 开始动画
}




//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
