//
//  MessageCell.h
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;

@interface MessageCell : UITableViewCell

@property (strong, nonatomic) MessageModel* message;

+ (MessageCell*)cellWithTableView:(UITableView*)tableView;

@end
