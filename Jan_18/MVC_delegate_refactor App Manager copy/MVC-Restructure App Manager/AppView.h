//
//  AppView.h
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIView.h>

@class AppInfo;

@interface AppView : UIView

@property (nonatomic, strong) AppInfo* info;

+ (instancetype)appView;
+ (instancetype)appViewWithAppInfo:(AppInfo*)info;

@end
