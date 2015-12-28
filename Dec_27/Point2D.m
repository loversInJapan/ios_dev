#import "Point2D.h"
#import <math.h>

@implementation Point2D

- (void)setX:(double)x
{
    _x = x;
}

- (double)x
{
    return _x;
}

- (void)setY:(double)y
{
    _y = y;
}

- (double)y
{
    return _y;
}

- (void)setX:(double)x AndY:(double)y
{
    [self setX:x];
    [self setY:y];
}

- (double)distanceWithAnotherPoint:(Point2D*)point;
{
    return [Point2D distanceBetween:self And:point];
}

+ (double)distanceBetween:(Point2D*)p1 And:(Point2D*)p2;
{
    double dis_x = [p1 x] - [p2 x];
    double dis_y = [p1 y] - [p2 y];
    return sqrt(pow(dis_x,2)+pow(dis_y,2));
}

@end