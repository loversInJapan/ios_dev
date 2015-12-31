//
//  Person.h
//  @property_memory_management
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Person : NSObject

@property int age;

@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) Book* book;

/*
 加上retain，则自动生成的book的set方法如下
 - (void)setBook:(Book *)book
 {
    if(book != _book){
        [_book release];
        _book = [book retain];
    }
 }
 不加retain的话则如下
 - (void)setBook:(Book *)book
｛
    _book = book;
 ｝
 
 另外，property的参数还有涉及多线程管理的：
 ＊nonatomic：一般加这个
 ＊atomic ：（默认）
 因此写property的时候要记得加上nonatomic
 */

@property(nonatomic, getter=isRich) BOOL rich;

/*
 返回BOOL类型的方法名一般以is开头
 getter= 和setter＝ 能改变get方法的名称和set方法的名称。
 BOOL类型的数据get方法一般以is开头，这是规范，所以常见把bool类型的数据的get方法改名如上。
 */
@end
