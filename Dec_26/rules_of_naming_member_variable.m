#import <Foundation/Foundation.h>

typedef enum{
    SexMan,
    SexWoman
} Sex;

/*
 成员变量名的命名规范：一定要以_开头。
 1.作用：让成员变量名与get方法的名称区分开
 2.可以跟局部变量分开，一开到以下划线开头的变量就知道时成员变量
 */
@interface Student : NSObject
{
    Sex _sex;
    int _No;
}

- (void)setSex:(Sex)sex;
- (void)sex;
- (void)setNo:(int)No;
@end

@implementation Student
- (void)setSex:(Sex)sex;
{
    if(sex != SexMan && sex != SexWoman)
        sex = SexMan;
    _sex = sex;
}

-(void)sex
{
    if(_sex == SexMan)
        NSLog(@"this student's sex is male");
    else
        NSLog(@"this student's sex is female");
}

- (void)setNo:(int)No;
{
    _No = No;
}
@end

int main()
{
    Student* Bob = [Student new];
    [Bob setSex:SexMan];
    [Bob sex];
    return 0;
}