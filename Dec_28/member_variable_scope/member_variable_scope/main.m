//
//  main.m
//  member_variable_scope
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    // id是万能指针，能指向任何OC对象。注意，id不能后不能加＊。
    id p = [Person new];
    //p.money = 100;
    [p setMoney:100];
    NSLog(@"money = %d", [p money]);

    return 0;
}
