#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    //@public
    int age_;
}

- (void)study;
/*
 set方法：
 1.作用：提供一个方法给外界设置成员变量值
 2.命名规范
 1）方法要以set开头，后面接变量名称，且成员变量的第一个字母为大写
 2）返回值一定时void
 3）一定要接受一个参数，且类型一致
 4）形参与实参的名称不能一样
 */
/*
 get方法：
 1.作用：返回对象内部的成员变量
 2.命名规则：
 1）返回值与成员变量的类型一致
 2）方法名与变量名一样
 3）不需要接收任何参数
 */
- (void)setAge:(int)age;

@end

@implementation Student

- (void)study
{
    NSLog(@"a %d years old student is studying",age_);
}

- (void)setAge:(int)age
{
    if(age <= 0)
        age = 2;
    age_ = age;
}
@end

int main()
{
    Student* Allice = [Student new];
    //Allice->age = 10;
    [Allice setAge:-1];
    [Allice study];
    return 0;
}