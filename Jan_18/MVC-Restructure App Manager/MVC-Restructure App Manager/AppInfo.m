//
//  AppInfo.m
//  MVC-Restructure App Manager
//
//  Created by Jon_Snow on 1/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

@synthesize image = _image;

- (UIImage *)image
{
    if(_image == nil)
    {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

+ (NSArray *)appList
{
    NSArray* appList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];

    NSMutableArray* mAppList = [NSMutableArray array];
    for (NSDictionary* dict in appList) {
        [mAppList addObject:[self appInfoWithDictionary:dict]];
    }
    
    return mAppList;
}

@end
