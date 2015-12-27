/*
 设计一个计算器类
 方法：
 1.返回PI
 2.计算某个整数的平方
 3.计算两个整数的和
*/

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(double)getPI;
-(int)sumWithNum1:(int)num1 andNum2:(int)num2;//该方法的方法名叫做sumWithNum1:andNum2:
-(int)square:(int)num;//OC方法中一个参数对应一个冒号
                      //该方法名称为square:（冒号也是方法名的一部分）

@end

@implementation Calculator

-(double)getPI
{
    return 3.14;
}

-(int)square:(int)num
{
    return num * num;
}

//-(int)sum:(int)num1 :(int)num2
-(int)sumWithNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

@end

int main()
{
    Calculator* pcal = [Calculator new];
    double pi = [pcal getPI];
    NSLog(@"pi = %lf",pi);
    int val = [pcal square:10];
    NSLog(@"val = %d",val);
    int sum = [pcal sumWithNum1:2 andNum2:4];
    NSLog(@"sum = %d",sum);

    int square4 = [[Calculator new] square:4];
    NSLog(@"square4 = %d",square4);

    return 0;
}