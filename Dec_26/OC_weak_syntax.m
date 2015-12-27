#import <Foundation/Foundation.h>

@interface Person : NSObject

@end

@implementation Person

@end

/*
 *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[Person test]: unrecognized selector sent to instance 0x7fda38502870'
经典错误：给Person对象发送了一个不能识别的消息：test
 */

// 一旦我们的程序在运行时出错，就会发生闪退
int main()
{
    Person* p = [Person new];
    //OC是在运行过程中才会检测对象有没有实现相应的方法，可以只实现不声明。
    [p test];
    return 0;
}