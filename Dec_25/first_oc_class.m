/*
class name : Car
attribute: wheels_, speed_
member function: void run()
*/

//1.declaration
//声明对象的属性和行为
#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    @public
    //这两个变量也叫实例变量，也可以称为成员变量
    unsigned wheels_;
    double speed_;
}

// 方法／行为 跟函数的形式有很大的区别
// 只要是OC对象的方法，必须以-（减号）开头
// OC方法中任何数据类型都必须用小括号扩住
// OC方法中的小括号的唯一作用：括住数据类型
-(void)run;

@end //告诉编译器类声明完毕

//2.define

@implementation Car
// 方法的实现只能写在这，即implementation中
-(void)run
{
    NSLog(@"this car is running");
}


@end

int main()
{
    //在OC中，想执行一些行为，就得用一个中括号,格式：[行为执行者 行为名称]
    Car* cp = [Car new];//执行Car这个类的new行为来创建一个对象，并把新对象的地址返回给CP
                        //定义一个指针变量cp, cp指向一个Car类型的对象。OC中我们只能通过指针来操作对象。
    cp->wheels_ = 4;
    cp->speed_ = 30.5;
    
    //给cp所指向的对象发送一条run消息，然后去对象的实现中寻找run方法，找到后执行run中的代码
    [cp run];
    
    NSLog(@"this car have %u wheels, it's speed is %.2lf km/h", cp->wheels_, cp->speed_);
    return 0;
}