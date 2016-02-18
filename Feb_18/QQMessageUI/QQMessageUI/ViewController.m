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

//static NSString *ID = @"Cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray* messages;

@end

@implementation ViewController
- (NSMutableArray *)messages
{
    if (_messages == nil) {
        _messages = [MessageModel messageList];
    }
    return _messages;
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
    return self.messages.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell* cell = [MessageCell cellWithTableView:tableView];
    cell.message = self.messages[indexPath.row];

    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}
@end
