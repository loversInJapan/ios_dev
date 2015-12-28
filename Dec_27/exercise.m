#import "Point2D.h"
#import "Circle.h"

int main()
{
//    Point2D* p1 = [Point2D new];
//    [p1 setX:3 AndY:3];
//    Point2D* p2 = [Point2D new];
//    [p2 setX:2 AndY:2];
//
//    double distane = [p1 distanceWithAnotherPoint:p2];
//    NSLog(@"distance = %lf", distane);
    Circle* c1 = [Circle new];
    Circle* c2 = [Circle new];
    [c1 setCentreWith:1 And:2];
    [c1 setRedius:3.1];
    [c2 setCentreWith:4 And:6];
    [c2 setRedius:2];
    BOOL result = [c1 ifThisCircleIntersectOtherCircle:c2];
    if(result)
        NSLog(@"YES");
    else
        NSLog(@"NO");

    return 0;
}

