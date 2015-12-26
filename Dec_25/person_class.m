/*
 class name : Person
 Attribute : weight_, age_
 method : walk
*/

#import <Foundation/Foundation.h>

//@interface中只能声明变量，而不能给变量赋值
//函数能写在文件中的任何位置除了interface中，而类方法只能写在implementation中

@interface Person : NSObject
{
    @public
    //static double weight_;//类中的变量并不允许声明称static类型的，同时类中的方法也不能声明成static的
    double weight_;
    unsigned age_;
}

-(void)walk;

@end

@implementation Person

-(void)walk
{
    static int data;
    NSLog(@"a person weighted %.2lf, aged %u years is walking", weight_, age_);
}

@end

/*
 当程序调用某个类创建对象时，该类会被调进内存，而且只调一次。
 该类中只有类的方法列表，没有数据成员。
 每个对象中都会有一个ISA指针指向对象所属的类，如当我们给p1对象发送个walk消息时，p1会借助isa指针找到p1的类，
 然后在p1的类中找walk方法，找到后执行代码。
 */


int main()
{
    Person* p1 = [Person new];
    p1->weight_ = 70.1;
    p1->age_ = 30;
    [p1 walk];
    
    Person* p2 = [Person new];
    p2->weight_ = 74.5;
    p2->age_ = 29;
    [p2 walk];
    return 0;
}