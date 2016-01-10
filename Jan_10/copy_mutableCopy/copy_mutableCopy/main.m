//
//  main.m
//  copy_mutableCopy
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 浅拷贝与深拷贝的区别
        NSMutableArray* array1 = [NSMutableArray arrayWithObjects:
                                  [NSMutableString stringWithString:@"one"],
                                  [NSMutableString stringWithString:@"two"],
                                  [NSMutableString stringWithString:@"three"],
                                  nil];
        NSMutableArray* array2 = [array1 mutableCopy]; // 仅仅将数组中的每个元素的引用复制一份并
                                                        // 赋值给array2，这是浅复制
        NSMutableString* mstr;

        NSLog(@"array1:");
        for(NSString* elem in array1)
            NSLog(@"%@", elem);

        mstr = [NSMutableString stringWithString:array2[0]]; // 创建了一块新的内存来，存储“one“
        [mstr appendString:@"ONE"];
        [array2 replaceObjectAtIndex:0 withObject:mstr];
        // 上面3句将把array2的第一个元素改变，而不改变array1的第一个元素。

        //[array1 removeObjectAtIndex:0];

        NSLog(@"array1:");
        for(NSString* elem in array1)
            NSLog(@"%@", elem);

    }
    return 0;
}


// 赋值与copy的区别
void test()
{
    NSMutableArray* array1 = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four", nil];
    NSMutableArray* array2;

    array2 = array1;

    [array2 removeObjectAtIndex:0];

    NSLog(@"array1:");
    for(NSString* elem in array1)
        NSLog(@"%@", elem);

    NSLog(@"array2:");
    for(NSString* elem in array2)
        NSLog(@"%@", elem);


    array2 = [array1 mutableCopy];

    [array1 removeObjectAtIndex:1];

    NSLog(@"array1:");
    for(NSString* elem in array1)
        NSLog(@"%@", elem);

    NSLog(@"array2:");
    for(NSString* elem in array2)
        NSLog(@"%@", elem);

}
