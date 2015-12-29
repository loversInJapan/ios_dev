//
//  main.m
//  Category
//
//  Created by   益康 陈 on 12/29/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+asia.h"
/*
 Category（分类）：可以给某一个类扩充一些方法（不修改原来类的代码）
 
 使用注意：
 1. Category只能增加方法，不能增加成员变量
 2. 分类方法实现中能访问原来类声明的成员变量
 3. 分类优先级比原来的类的优先级高。如果几个分类有几个相同命名的方法，优先调用分类中的方法，分类找不到再到原类中找，找不到就去父类中找
 4. 因此，分类可以重新实现原来类的方法，但会覆盖掉原来的方法，导致原来的方法没法再使用
 */

int main(int argc, const char * argv[]) {
    Person* p = [[Person alloc] init];
    [p test];
    [p skinColor];
    return 0;
}
