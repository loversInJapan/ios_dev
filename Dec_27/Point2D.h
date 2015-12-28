/*
 设计一个类Point2D，表示点的坐标。
 1.有两个成员变量：
 double x；
 double y；
 2.
 1）设计一个对象方法同时设置x和y的值
 2）设计一个对象方法计算两点之间的距离
 3）设计一个对象方法计算该点与其它点的距离
 */

#import <Foundation/Foundation.h>

@interface Point2D : NSObject
{
    double _x;
    double _y;
}

- (void)setX:(double)x;
- (double)x;

- (void)setY:(double)y;
- (double)y;

- (void)setX:(double)x AndY:(double)y;
- (double)distanceWithAnotherPoint:(Point2D*)point;

+ (double)distanceBetween:(Point2D*)p1 And:(Point2D*)p2;

@end
