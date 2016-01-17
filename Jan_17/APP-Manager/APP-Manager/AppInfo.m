//
//  AppInfo.m
//  APP-Manager
//
//  Created by Jon_Snow on 1/17/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "AppInfo.h"

/** 字典转换成模型 */
@implementation AppInfo
// 合成指令，主动指定属性使用的成员变量名称
@synthesize image = _image;

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // KVC - key value coding，是一种间接修改／读对象属性的一种方法。KVC被称为cocoa的大招
        // 参数：1.数值；2.属性名称
//        self.name = dict[@"name"];
//        self.icon = dict[@"icon"];
//        [self setValue:dict[@"name"] forKeyPath:@"name"];
//        [self setValue:dict[@"icon"] forKeyPath:@"icon"];
        [self setValuesForKeysWithDictionary:dict];//本质上就是调用以上两句代码
    }
    return self;
}

+ (instancetype)appInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (UIImage *)image
{
    if (_image == nil) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

+ (NSArray *)appList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    // 创建临时数组，保存appinfo。
    NSMutableArray* marray = [NSMutableArray array];

    for (NSDictionary* dict in array) { // 遍历数组，将字典转成模型
        // AppInfo* info = [[AppInfo alloc] initWithDictionary:dict];

        //AppInfo* info = [AppInfo appInfoWithDictionary:dict];
        [marray addObject:[AppInfo appInfoWithDictionary:dict]];
    }
    return marray;
}

@end
