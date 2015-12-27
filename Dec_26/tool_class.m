//展示类方法的使用。

//工具类：没有成员变量的类，方法基本都是类方法的类
#import <Foundation/Foundation.h>

@interface Calculator : NSObject
+ (int)sumOfNum1:(int)num1 AndNum2:(int)Num2;

@end

@implementation Calculator

+ (int)sumOfNum1:(int)num1 AndNum2:(int)num2
{
    return num1 + num2;
}

@end

int main()
{
    NSLog(@"sum of 1 and 2 is %d", [Calculator sumOfNum1:1 AndNum2:2]);
    return 0;
}

