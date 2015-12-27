// 如Person* p =［Person new］中，new就是Person的类方法，而［p test]中test是对象方法，只能通过对象来调用.
// 识别标志是：对象方法以－（减号）开头，而类方法以＋（加号）开头.
// 类方法只能通过类名来调用.
// 类方法可以和对象方法重名。
// 类方法中不能访问成员变量


/*
 类方法的好处与使用场合：
 1）类方法更高效
 2）当方法不需要访问成员变量时尽量声明成类方法
 */
#import <Foundation/Foundation.h>

@interface Person : NSObject
+ (void)printClassName;
{
    int _age;
}
@end

@implementation Person

+ (void)printClassName
{
    NSLog(@"this class's name is Person");
    NSLog(@"this class's name is Person %d", age);//错误实例变量不能再类方法中访问

}

@end

int main()
{
    //Person* person1 = [Person new];
    [Person printClassName];
    return 0;
}