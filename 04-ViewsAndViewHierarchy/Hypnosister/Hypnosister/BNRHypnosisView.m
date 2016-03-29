//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

//FIXME:
// TODO:
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // image draw
    UIImage *img =[UIImage imageNamed:@"logo"];
    [img drawInRect:CGRectMake(20, 40, 80, 80)];
    
    //  Figure out the center of the bounds rectangle
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    
    //context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    

    
    
    
    
    // draw stroke
    CGContextSetStrokeColorWithColor(currentContext, [UIColor blackColor].CGColor);
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, center.x, center.y);
    CGPathAddLineToPoint(pathRef, NULL, center.x+80, center.y+90);
    CGContextAddPath(currentContext, pathRef); //注意别忘了 addPath
    CGContextStrokePath(currentContext);
    CGContextDrawPath(currentContext, kCGPathStroke);
    CGPathRelease(pathRef); // 注意别忘了释放Path
    
    
    //保存状态
    CGContextSaveGState(currentContext);
    //阴影
    CGContextSetShadow(currentContext, CGSizeMake(5, 20), 1);
    
    //draw rec
    CGRect rect2=CGRectMake(0, 0, 200, 200);
    CGContextSetStrokeColorWithColor(currentContext, [UIColor redColor].CGColor);
    CGContextSetLineWidth(currentContext, 2.0);
    CGContextStrokeRect(currentContext, rect2);

    //恢复状态
    CGContextRestoreGState(currentContext);
    
    
    //渐变
    CGFloat locations[3] = {0.0,0.5,1.0}; //三种颜色所在的相对位置
    CGFloat components[12] = {0.0, 0.0 ,0.0, 1.0,
                          1.0, 0.0, 0.0 ,1.0 ,
                          0.0,  1.0, 1.0, 1.0};//三种颜色
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef   gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 3);
    
    CGPoint startPoint =  CGPointMake(center.x, center.y);
    CGPoint endPoint   =  CGPointMake(center.x-40, center.y-100);
    
//    CGContextDrawRadialGradient(currentContext, gradient, startPoint, 100, endPoint,200, kCGGradientDrawsBeforeStartLocation);
    CGContextDrawRadialGradient(currentContext, gradient, startPoint, 40, endPoint,40, 0);

    CGPoint endPoint2   =  CGPointMake(center.x, center.y+100);

    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint2, 0);

    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    //渐变结束
    
    
    // The largest circle will circumstribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];

        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }

    // Configure line width to 10 points
    path.lineWidth = 10;

    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    

    // Draw the line!
    [path stroke];
    


}

@end
