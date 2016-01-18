//
//  AppInfo.h
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface AppInfo : NSObject

@property (nonatomic, copy) NSString* icon;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong, readonly) UIImage* image;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

+ (instancetype)appInfoWithDictionaru:(NSDictionary*)dict;

+ (NSArray*)appList;

@end
