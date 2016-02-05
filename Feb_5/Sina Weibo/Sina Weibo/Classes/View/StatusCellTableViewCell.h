//
//  StatusCellTableViewCell.h
//  Sina Weibo
//
//  Created by Jon_Snow on 2/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Statuses;

@interface StatusCellTableViewCell : UITableViewCell

@property (strong, nonatomic) Statuses* status;

@end
