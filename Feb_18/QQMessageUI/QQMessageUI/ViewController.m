//
//  ViewController.m
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "MessageCell.h"
#import "MessageModelFrame.h"
#import "Constants.h"

//static NSString *ID = @"Cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray* messageFrames;

@property (weak, nonatomic) IBOutlet UITableView *messageTableView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (strong, nonatomic) NSDictionary* autoReplay;
@end

@implementation ViewController
- (NSDictionary *)autoReplay
{
    if (_autoReplay == nil) {
        _autoReplay = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autoReplay.plist" ofType:nil]];
    }
    return _autoReplay;
}

- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        _messageFrames = [MessageModelFrame messageModelFrames];
    }
    return _messageFrames;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
/*
 2016-02-22 15:15:11.510 QQMessageUI[4533:149972] {
 UIKeyboardAnimationCurveUserInfoKey = 7;
 UIKeyboardAnimationDurationUserInfoKey = "0.25";
 UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
 UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 796}";
 UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 538}";
 UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
 UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
 UIKeyboardIsLocalUserInfoKey = 1;
 }
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //  取消tableview中单元格的选中
    self.messageTableView.allowsSelection = NO;
    // tableView的背景颜色
    self.messageTableView.backgroundColor = [UIColor colorWithRed:(225/250.0) green:(225/250.0) blue:(225/250.0) alpha:1];
    // 取消分隔线
    self.messageTableView.separatorStyle = UITableViewCellEditingStyleNone;

    // 键盘位置改变通知。 每个应用都有一个唯一的通知中心（单例），通知的发布者在这发布通知，通知的接受者在这接受通知。 这是一个多对多点关系。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardChangeFrame:(NSNotification*)notice
{
//    NSLog(@"%@", notice.userInfo);
    // 键盘退出时的Frame
    CGRect keyboardFrame = [notice.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 键盘的实时Y值
    CGFloat keyboardY = keyboardFrame.origin.y;
    CGFloat duration = [notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - kScreenH);
    }];
}

// 当tableView开始滑动时，结束编辑事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - cell data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell* cell = [MessageCell cellWithTableView:tableView];
    cell.messageFrame = self.messageFrames[indexPath.row];

    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModelFrame* fm = self.messageFrames[indexPath.row];
    return fm.cellH;
}

#pragma mark - textFile delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString* text = textField.text;
    [self addNewMessage:text WithType:MessageModelMe];
    // 清空textFile
    textField.text = @"";
    // 自动回复
    NSString* answer = [self getAnswer:text];
    [self addNewMessage:answer WithType:MessageModelFriend];
    // 一定是yes
    return YES;
}

- (NSString*)getAnswer:(NSString*)text
{
    for (int index = 0; index < text.length; ++index) {
        NSString* keyWord = [text substringWithRange:NSMakeRange(index, 1)];
        if (self.autoReplay[keyWord]) {
            return self.autoReplay[keyWord];
        }
    }
    return @"Go Away!";
}

- (void)addNewMessage:(NSString*)text WithType:(MessageModelType)type
{
    // 获取系统当前的时间
    NSDate* now = [NSDate date];
    NSDateFormatter* dateFomat = [[NSDateFormatter alloc] init];
    [dateFomat setDateFormat:@"HH:mm"];
    // 添加信息模型
    MessageModel* newMessage = [[MessageModel alloc] init];
    newMessage.text = text;
    newMessage.time = [dateFomat stringFromDate:now];
    newMessage.type = type;
    // 判断是否应该隐藏时间
    MessageModelFrame* lastFrame = [self.messageFrames lastObject];
    newMessage.shouldHideTime = [newMessage.time isEqualToString:lastFrame.message.time];
    // 添加cell的frame
    MessageModelFrame* newFrame = [[MessageModelFrame alloc] init];
    newFrame.message = newMessage;
    [self.messageFrames addObject:newFrame];

    // 更新frames
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count-1 inSection:0];
    [self.messageTableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
//    [self.messageTableView reloadData];
    //自动上拉
    [self.messageTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
@end
