//
//  AppInfo.h
//  APP-Manager
//
//  Created by Jon_Snow on 1/17/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface AppInfo : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* icon;
@property (nonatomic, strong, readonly) UIImage* image;

/**
 KVC使用注意：
 模型中的属性名应与plist中的key名称一致
 */

/**
 @property:
 1.生成getter和setter
 2.生成带下划线的成员变量。
 
 如果属性是readonly的，则不会生成带下划线的变量
 */

/**
 instancetype主要用于在类方法实例化对象时，让编译器主动推断对象的实机类型以避免使用id，会造成开发中不必要的麻烦，减少出错几率
 
 instancetype是苹果在iOS7才开始主推的。
 instancetype只能用于返回值！不能当作参数使用
 */
// 对象方法
- (instancetype)initWithDictionary:(NSDictionary*)dict;

/** 类方法可以快速实例化一个对象 */
+ (instancetype)appInfoWithDictionary:(NSDictionary*)dict;

/** 通常在写模型的实例化方法时，以上两个方法都需要实现 */

+ (NSArray*)appList;

@end
