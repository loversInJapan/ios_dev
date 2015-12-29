//
//  Person.h
//  member_variable_scope
//
//  Created by   益康 陈 on 12/28/15.
//  Copyright © 2015   益康 陈. All rights reserved.
//

#import <Foundation/Foundation.h>

// 在类的声明中，成员变量默认为@protect的
// 在类的实现中，成员变量默认为@private的

@interface Person : NSObject
{
    // @property int money; // 不能定义在成员变量的大括号范围中
    @public // 能再任何地方访问
    int _age;

    @private // 只能在当前类的对象方法中访问
    NSString* _name;

    @protected // 能在当前类和子类的对象方法中直接访问
    double _height;

    @package // 只要处在同一个框架中，就能直接访问对象的成员变量

}

@property int money;
@end
