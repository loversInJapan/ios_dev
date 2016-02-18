//
//  MessageModel.h
//  QQMessageUI
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    MessageModelMe = 0, //message send by me
    MessageModelFriend // message send by others
}MessageModelType;

@interface MessageModel : NSObject

@property (copy, nonatomic) NSString* text;
@property (copy, nonatomic) NSString* time;
@property (assign, nonatomic) MessageModelType type;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)messageWithDict:(NSDictionary*) dict;
+ (NSMutableArray*)messageList;

@end
