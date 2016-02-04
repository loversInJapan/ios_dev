//
//  GroupShopFooterView.h
//  GroupShop
//
//  Created by Jon_Snow on 1/30/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupShopFooterView;

@protocol GroupShopFooterViewDelegate <NSObject>

- (void)loadMoreDidClickDownloadButton:(GroupShopFooterView*)view;

@end

@interface GroupShopFooterView : UIView
@property (nonatomic, weak) id <GroupShopFooterViewDelegate> delegate;

+ (instancetype)footerView;
@end
