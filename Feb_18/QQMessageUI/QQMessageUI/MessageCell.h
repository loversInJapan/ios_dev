//
//  MessageCell.h
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModelFrame;

@interface MessageCell : UITableViewCell

@property (strong, nonatomic) MessageModelFrame* messageFrame;

+ (MessageCell*)cellWithTableView:(UITableView*)tableView;

@end
