//#import用途一：与＃include一样
//每个框架都有自己的主头文件，名字与框架名一样。 当我们想把该框架的所有头文件包含进来时，只需要包含该主头文件就好。
//主头文件中的内容就是该框架的所有的头文件
//Foundation是个框架名称
#import <Foundation/NSObjCRuntime.h>
//链接时应加上 －framework Foundation
int main()
{
    //NSLog输出内容会自动换行
    NSLog(@"second OC program");
    return 0;
}