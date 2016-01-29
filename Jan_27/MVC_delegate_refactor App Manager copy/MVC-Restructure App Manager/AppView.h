//
//  AppView.h
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIView.h>

@class AppInfo;
@class AppView;
// 1. 协议名以类名开始+Delegate
@protocol AppViewDelegate <NSObject>

@optional
// 2. 协议方法，以类名开始(没有类前缀)，第一个参数是自己
// 只是定义方法名，不做具体实现
- (void)appViewDidClickDownloadButton:(AppView*)appView;

@end

@interface AppView : UIView
// 3. 定义代理属性，遵守了HMAppViewDelegate协议的任意一个对象，都可以成为代理
@property (nonatomic, weak) id<AppViewDelegate> delegate;

@property (nonatomic, strong) AppInfo* info;

+ (instancetype)appView;
+ (instancetype)appViewWithAppInfo:(AppInfo*)info;

@end
