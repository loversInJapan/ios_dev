//
//  main.m
//  NSDictionary
//
//  Created by Jon_Snow on 1/2/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 字典：
 
 key ---> value
 索引 ---> 文字内容
 
 字典存的东西事key－value对
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSDictionary* dict = [NSDictionary dictionaryWithObject:@"jack" forKey:@"name"];
//
//        id obj = [dict objectForKey:@"name"];
//
//        NSLog(@"%@", obj);
//
//        NSDictionary* dicts = @{@"name":@"jack", @"Address":@"New York"}; // 用这个
//
//        id obj1 = dicts[@"Address"];
//
//        NSLog(@"%@", obj1);
        // 以上为不可变的字典
        // 下面将介绍可变字典

        NSMutableDictionary* m_dict = [NSMutableDictionary dictionary];

        [m_dict setObject:@"beijing" forKey:@"address"];

        [m_dict setObject:@"jack" forKey:@"name"];

        [m_dict setObject:@"rose" forKey:@"name"]; // 一个字典中一个key只能对一个value，后面添加的value会覆盖前面相同key的value。
        NSLog(@"%@", m_dict[@"name"]);

        NSLog(@"%ld", m_dict.count);

        // 字典的遍历

        NSDictionary* dicts = @{@"name1":@"tom", @"name2":@"tom", @"name3":@"tom", @"address":@"shanghai",@"qq":@"1234"};
        NSArray* keys = [dicts allKeys];
        for (unsigned i = 0; i < keys.count; ++i) {
            id key = keys[i];
            id obj = dicts[key];

            NSLog(@"%@ : %@", key, obj);
        }
    }
    return 0;
}
