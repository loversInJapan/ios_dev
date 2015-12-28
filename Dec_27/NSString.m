#import <Foundation/Foundation.h>

int main()
{
    //创建OC字符串的一种方式
    NSString* str = @"OC string";
    int size = [str length];
    NSLog(@"this is an %@, size = %d", str, size);

    //创建OC字符串的另一种方式，将字符串与变量结合再一起合成新的字符串
    int age = 15;
    int No = 1001;
    NSString* format_str = [NSString stringWithFormat:@"my age is %d and No is %d", age, No];
    NSLog(@"%@", format_str);
    return 0;
}