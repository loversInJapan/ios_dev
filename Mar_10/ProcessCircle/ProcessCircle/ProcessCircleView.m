//
//  ProcessCircleView.m
//  ProcessCircle
//
//  Created by Jon_Snow on 3/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ProcessCircleView.h"

@implementation ProcessCircleView

- (void)drawRect:(CGRect)rect
{
    CGFloat viewH = rect.size.height;
    CGFloat viewW = rect.size.width;

    CGFloat textH = 20;
    CGFloat textW = 35;
    CGFloat textX = (viewW - textW) * 0.5;
    CGFloat textY = (viewH - textH) * 0.5;
// 画文字
    NSString* text = [NSString stringWithFormat:@"%d%%", (int)self.finished];
//    NSDictionary* attri = @{NSFontAttributeName : 
    [text drawInRect:CGRectMake(textX, textY, textW, textH) withAttributes:nil];
    // 画弧
    CGFloat radius = (viewH - 10)*0.5;
    CGFloat endAngle = self.finished * M_PI * 2 - M_PI_2;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, viewW*0.5, viewH*0.5, radius, - M_PI_2, endAngle, 0);
    CGContextStrokePath(context);
}

- (void)setFinished:(CGFloat)finished
{
    _finished = finished;

    [self setNeedsDisplay];
}
@end
