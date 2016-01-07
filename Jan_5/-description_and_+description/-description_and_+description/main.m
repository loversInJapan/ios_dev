//
//  main.m
//  -description_and_+description
//
//  Created by Jon_Snow on 1/5/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* Alice = [[Person alloc] init];
        Alice.age = 10;
        Alice.name = @"Alice";
        NSLog(@"%@", Alice);

        // 返回Alice的类类型
        Class c = [Alice class];
        // 拿到+description方法的返回值（NSString＊）显示到屏幕上，默认返回类名
        NSLog(@"%@", c);
    }
    return 0;
}
