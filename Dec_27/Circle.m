#import "Circle.h"

@implementation Circle

- (void)setRedius:(double)redius
{
    _redius = redius;
}

- (double)redius
{
    return _redius;
}

- (void)setCentreWith:(double)coo_x And:(double)coo_y
{
    _centre = [Point2D new];
    [_centre setX:coo_x AndY:coo_y];
}

- (Point2D*)centre
{
    return _centre;
}

- (BOOL)ifThisCircleIntersectOtherCircle:(Circle*)circle
{
    return [Circle ifCircle1:self IntersectCircle2:circle];
}

+ (BOOL)ifCircle1:(Circle*)c1 IntersectCircle2:(Circle*)c2
{
    Point2D* centre1 = [c1 centre];
    double redius1 = [c1 redius];
    Point2D* centre2 = [c2 centre];
    double redius2 = [c2 redius];

    double distance_between_two_centers = [centre1 distanceWithAnotherPoint:centre2];
    double sum_of_two_redius = redius1 + redius2;

    //    if(distance_between_two_centers < sum_of_two_redius)
    //        return YES;
    //    else
    //        return NO;
    return distance_between_two_centers < sum_of_two_redius;
}

@end