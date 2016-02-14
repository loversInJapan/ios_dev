//
//  ViewController.m
//  打砖块
//
//  Created by Jon_Snow on 2/13/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UIImageView *paddle;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *bricks;
@property (weak, nonatomic) IBOutlet UILabel *massageLabel;

// 小球初始位置
@property (assign, nonatomic) CGPoint ballOriginCenter;
// 挡板的初始位置
@property (assign, nonatomic) CGPoint paddleOriginCenter;
// 游戏时钟
@property (strong, nonatomic) CADisplayLink* gameTimer;
// 小球的速度
@property (assign, nonatomic) CGPoint ballVelocity;
// 挡板水平方向的速度
@property (assign, nonatomic) CGFloat paddleHorizentalVelocity;
// 背景音乐
@property (strong, nonatomic) AVAudioPlayer* musicPlayer;

@end

@implementation ViewController
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 碰撞检测方法
// 与屏幕的碰撞
- (void)intersetWithScreen
{
    // 与屏幕的上方做碰撞检测
    if (CGRectGetMinY(self.ballImageView.frame) <= 0) {
//        CGPoint tmp = self.ballVelocity;
//        tmp.y = ABS(tmp.y);
//        self.ballVelocity = tmp;
        _ballVelocity.y = ABS(_ballVelocity.y);
    }
    // 与屏幕的左边做碰撞检测
    if (CGRectGetMinX(self.ballImageView.frame) <= 0) {
//        CGPoint tmp = self.ballVelocity;
//        tmp.x = ABS(tmp.x);
//        self.ballVelocity = tmp;
        _ballVelocity.x = ABS(_ballVelocity.x);
    }
    // 与屏幕的右边做碰撞检测
    if (CGRectGetMaxX(self.ballImageView.frame) >= self.view.bounds.size.width) {
//        CGPoint tmp = self.ballVelocity;
//        tmp.x = -ABS(tmp.x);
//        self.ballVelocity = tmp;
        _ballVelocity.x = -ABS(_ballVelocity.x);
    }
    // 如果掉出屏幕底部，则游戏结束
    if (CGRectGetMinY(self.ballImageView.frame) > self.view.bounds.size.height) {
        NSLog(@"You lose!");
        [self.gameTimer invalidate];

        self.massageLabel.hidden = NO;
        self.massageLabel.text = @"Sorry...\n Tap your screen to try again";
        [self.tapGesture setEnabled:YES];
    }
}

// 与挡板的碰撞检测
- (void)intersetWithPaddle
{
    if (CGRectIntersectsRect(self.ballImageView.frame, self.paddle.frame)) {
//        CGPoint tmp = self.ballVelocity;
//        tmp.y = -ABS(tmp.y);
        _ballVelocity.y = -ABS(_ballVelocity.y);
        _ballVelocity.x += self.paddleHorizentalVelocity / 120.0; // 初始挡板的速度太快，需要做处理
//        self.ballVelocity = tmp;
    }
}

// 与砖块的碰撞检测
- (void)intersetWithBricks
{
    for (UIImageView* brick in self.bricks) {
        if (CGRectIntersectsRect(self.ballImageView.frame, brick.frame) && !brick.hidden) {
            CGPoint tmp = self.ballVelocity;
            tmp.y = ABS(tmp.y);
            self.ballVelocity = tmp;
            // 隐藏砖块
            brick.hidden = YES;
            break;
        }
    }
    BOOL win = YES;
    for (UIImageView* brick in self.bricks) {
        if (!brick.hidden) {
            win = NO;
            break;
        }
    }
    if (win) {
        self.tapGesture.enabled = YES;
        self.massageLabel.hidden = NO;
        self.massageLabel.text = @"WIN!!!\nTap to restart.";
        [self.gameTimer invalidate];
    }
}
// 屏幕刷新时做的事情
- (void)thingsToDoWhenRefreshSreen
{
    NSLog(@"refresh screen");
    [self intersetWithScreen];
    [self intersetWithPaddle];
    [self intersetWithBricks];
    self.ballImageView.center = CGPointMake(self.ballImageView.center.x + self.ballVelocity.x, self.ballVelocity.y + self.ballImageView.center.y);
}

// 点击开始游戏
- (IBAction)tapToBeginGame:(id)sender
{
    NSLog(@"taped screen");
    // 将显示信息隐藏
    self.massageLabel.hidden = YES;
    // 设置小球,挡板的初始位置，以及将砖块复原
    self.ballImageView.center = self.ballOriginCenter;
    self.paddle.center = self.paddleOriginCenter;
    for (UIImageView* brick in self.bricks) {
        brick.hidden = NO;
    }
    // 设置移动速度
    self.ballVelocity = CGPointMake(0.0, -5.0);
    // 创建游戏时钟
    self.gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(thingsToDoWhenRefreshSreen)];
    // 把游戏时钟加到主运行循环中
    [self.gameTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    // 禁用游戏开始点击手势
    self.tapGesture.enabled = NO;
}

- (IBAction)dragPaddle:(UIPanGestureRecognizer *)sender
{
    // 滑动手指时改变挡板的水平速度
    // 需要判断挡板是否在运动
    if (UIGestureRecognizerStateChanged == sender.state) {
        // 取出手指移动到的位置
        CGPoint location = [sender locationInView:self.view];
        // 改变挡板的位置
        [self.paddle setCenter:CGPointMake(location.x, self.paddle.center.y)];

        // 将手指的移动速度赋给挡板的水平速度
        self.paddleHorizentalVelocity = [sender velocityInView:self.view].x;
    }else{
        self.paddleHorizentalVelocity = 0.0;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 记录小球的初始位置
    self.ballOriginCenter = self.ballImageView.center;
    self.paddleOriginCenter = self.paddle.center;
    // 播放背景音乐
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:@"/Users/jon/ios_dev/Feb_13/打砖块/打砖块/background-music.caf"] error:nil];
    self.musicPlayer.volume = 1.0;
    [self.musicPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
