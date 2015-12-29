//
//  NSString+NSString_Number.h
//  add_category_to_NSString
//
//  Created by Jon_Snow on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

// 给NSString增加一个类方法：计算某个字符串中阿拉伯数字的个数
// 给NSString增加一个对象方法：计算某个字符串中阿拉伯数字的个数

@interface NSString (NSString_Number)

+ (unsigned)numCountOfNSString:(NSString*)str;
- (unsigned)numCountMethod;

@end
