//
//  main.m
//  block
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

void printALine()
{
    NSLog(@"--------------");
}

// typedef 定义函数指针

typedef int(*SumP)(int,int);  // 将int(*)(int,int)形的函数指针定义成SumP

int sumFoo(int a, int b)
{
    return a + b;
}

// typedef 定义block
typedef int(^MyBlock)(int,int);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // block用来保存一段代码，block的标志是^
        // block跟函数很想，可以保存代码，有返回值，有形參

        // 定义block变量，跟函数指针很像
        printALine();

        // 没有返回值，没有形参的block
        void (^myblock)() = ^{        // 这里也可以写成^(){
            NSLog(@"this is a block");
        };

        // 利用block变量调用block内部的代码

        myblock();

        // 接受两个整形形参，返回一个整形值
        /*
        int (^sumBlock)(int, int) = ^(int a, int b){
            return a+b;
        };

        int sum = sumBlock(10, 21);
        NSLog(@"sum = %d", sum);
         */

        void (^printNLines)(int) = ^(int n){
            for (int i = 0; i < n; ++i) {
                NSLog(@"-----------");
            }
        };

        printNLines(5);

        SumP p = sumFoo;
        SumP p2 = sumFoo;

        NSLog(@"%d - %d", p(1,2), p2(5,6));

        MyBlock sumBlock;
        sumBlock = ^(int a, int b){
            return a+b;
        };

        MyBlock minusBlock;
        minusBlock = ^(int a, int b){
            return a-b;
        };

        NSLog(@"%d - %d", sumBlock(1,2), minusBlock(2,5));

    }
    return 0;
}
