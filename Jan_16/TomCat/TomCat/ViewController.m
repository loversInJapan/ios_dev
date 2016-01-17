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
 
 
 关于图像实例化：
 方法imageNamed：是系统推荐用的，但图像实例化后的释放由系统负责。
 如果想要自己释放，那就不能用该方法。
 
 使用imageWithContentsOfFile:path方法，要将图像文件放在Supporting Files文件夹中，不能放在Assets文件夹中。否则将不能用mainBundle方法获取到文件路径，切记！

 */

- (void)tomAnimationWithName:(NSString*)name AndImageAmount:(NSInteger)count
{
    if ([self.tom isAnimating]) {
        return;
    } // 如果动画正在执行，则返回

    NSMutableArray* imageArray = [NSMutableArray array];
    for (int i = 0; i < count; ++i) {
        NSString* imageName = [NSString stringWithFormat:@"%@_%02d.jpg", name, i]; // 02表示显示2位数，不够前面补零
        // UIImage* image = [UIImage imageNamed:imageName]; // 不用imageNamed：方法
        NSString* path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage* image = [UIImage imageWithContentsOfFile:path];
        [imageArray addObject:image];
    }
    self.tom.animationImages = imageArray; // 添加动画数组
    self.tom.animationRepeatCount = 1; // 动画重复次数，默认为0，0代表不断重复
    self.tom.animationDuration = self.tom.animationImages.count * 0.075;// 设置动画执行时间
    [self.tom startAnimating];// 开始动画

    // 动画“结束”之后清理动画图片数组，用延迟执行，将self.tom.animationImages置为nil接触强引用，数组便被释放
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration]; // 这里setAnimationImages:是属性animationImages的setter。
}

- (IBAction)tomAction:(UIButton*)sender
{
    [self tomAnimationWithName:sender.currentTitle AndImageAmount:sender.tag];
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

- (IBAction)drinkMilk
{
    [self tomAnimationWithName:@"drink" AndImageAmount:81];
}

- (IBAction)fart
{
    [self tomAnimationWithName:@"fart" AndImageAmount:28];
}

- (IBAction)cymbal
{
    [self tomAnimationWithName:@"cymbal" AndImageAmount:13];
}
- (IBAction)knockOut
{
    [self tomAnimationWithName:@"knockout" AndImageAmount:81];
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
