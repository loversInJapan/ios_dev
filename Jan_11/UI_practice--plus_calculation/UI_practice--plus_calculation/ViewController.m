//
//  ViewController.m
//  UI_practice--plus_calculation
//
//  Created by Jon_Snow on 1/11/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSLog(@"********");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compute
{
    // NSLog(@"compute");
    // 取得界面上两个文本框的内容
    NSString* s1 = self.num1.text;
    NSString* s2 = self.num2.text;
    // 将内容相加
    double sum = [s1 floatValue] + [s2 floatValue];

    // 显示结果在右侧标签中
    self.resultLable.text = [NSString stringWithFormat:@"%lf", sum];

    // 关闭键盘
//    [self.num1 resignFirstResponder]; // 退出光标所在的文本框的键盘
//    [self.num2 resignFirstResponder];
    [self.view endEditing:YES]; // 让视图关闭键盘，无论现在谁是第一响应者
                                // 参数表示是非强制关闭键盘
}

@end
