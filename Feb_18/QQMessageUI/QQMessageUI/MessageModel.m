//
//  MessageModel.m
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSMutableArray *)messageList
{
    NSArray* array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for (NSDictionary* dict in array) {
        [arrayM addObject:[self messageWithDict:dict]];
    }
    return arrayM;
}
@end
