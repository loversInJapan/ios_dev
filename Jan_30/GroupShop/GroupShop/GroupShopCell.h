//
//  GroupShopCell.h
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupShopInfo;

@interface GroupShopCell : UITableViewCell
// 团购信息模型
@property (strong, nonatomic) GroupShopInfo* info;

+ (GroupShopCell*)cellWithTableView:(UITableView*)tableView;
@end
