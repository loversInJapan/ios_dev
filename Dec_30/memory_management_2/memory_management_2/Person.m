//
//  Person.m
//  memory_management_2
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setBook:(Book *)book
{
    if(book != _book){
    // 对当前使用的书先进行release
        [_book release]; // 加上这一行，内存管理才完善，但需要先做if判断
        _book = [book retain]; // 单单这样写有问题，当当前Person对象换一本书时，将不会对原来的书对象计数器－1，造成内存泄漏
    }
}

- (Book *)book
{
    return _book;
}

- (void)setName:(NSString *)name
{
    if(name != _name){
        [_name release];
        _name = [name retain];
    }
}

- (NSString *)name
{
    return _name;
}

- (void)dealloc
{
    NSLog(@"Person instance is destroyed");
    [_name release];
    [_book release];
    [super dealloc];
}
@end
