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

//static NSString *ID = @"Cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray* messageFrames;

@end

@implementation ViewController
- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        _messageFrames = [MessageModelFrame messageModelFrames];
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.tableView registerClass:[self.tableView class] forCellReuseIdentifier:ID];

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
@end
