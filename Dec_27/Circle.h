/*
 设计一个Circle类，用来表示二维平面中的圆
 属性：
 * double _redius
 * Point2D* _centre
 方法：
 ＊ 属性相应的set和get方法
 ＊ 设计一个对象方法判断该圆是否与其它圆相交（相交返回yes，否则返回no）
 ＊ 设计一个类方法判断两个圆是否相交（相交返回yes，否则返回no）
 */

#import <Foundation/Foundation.h>
#import "Point2D.h"

@interface Circle : NSObject
{
    double _redius;
    Point2D* _centre;
}

- (void)setRedius:(double)redius;
- (double)redius;

- (void)setCentreWith:(double)coo_x And:(double)coo_y;
- (Point2D*)centre;

- (BOOL)ifThisCircleIntersectOtherCircle:(Circle*)circle;
+ (BOOL)ifCircle1:(Circle*)c1 IntersectCircle2:(Circle*)c2;

@end