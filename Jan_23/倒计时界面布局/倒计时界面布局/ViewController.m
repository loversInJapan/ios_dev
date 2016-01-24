//
//  ViewController.m
//  倒计时界面布局
//
//  Created by Jon_Snow on 1/23/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) NSTimer* timer;

@end

@implementation ViewController

- (IBAction)play
{
    // 在view中添加textview，并且点击它时，计时器将停止。
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerLabel:) userInfo:nil repeats:YES];
    // 以下代码能够解决上述问题
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimerLabel:) userInfo:nil repeats:YES];
    // 将timer添加到运行循环，模式为监听滚动模式
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimerLabel:(NSTimer*)timer
{
    int count = self.timeLabel.text.intValue;
    if(--count < 0){
        [self pause];
        // 提示用户提示框
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Go!!!!" message:@"ready to go" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
        UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"no" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){}];
//        NSArray* actions = [NSArray arrayWithObjects:action1, action2, nil];
//        alert.actions = actions;
        [alert addAction:action1];
        [alert addAction:action2];

        [self presentViewController:alert animated:YES completion:nil];
    }else{
        // 更新显示时间
        self.timeLabel.text = [NSString stringWithFormat:@"%d",count];
    }
}

- (IBAction)pause
{
    // 停止时钟的唯一方法，一旦调用该方法，时钟将永久失效，必须重新进行实例化才能使用
    [self.timer invalidate];
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
