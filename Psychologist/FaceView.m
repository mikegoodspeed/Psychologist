//
//  FaceView.m
//  Happiness
//
//  Created by Mike Goodspeed on 5/15/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "FaceView.h"

@interface FaceView ()
- (void)drawCircleAtPoint:(CGPoint)point
               withRadius:(CGFloat)radius
                inContext:(CGContextRef)context;
@end

@implementation FaceView

#pragma mark - init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Properties

@synthesize delegate = delegate_;

#pragma mark - dealloc

- (void)dealloc
{
    [super dealloc];
}

- (void)drawCircleAtPoint:(CGPoint)point
               withRadius:(CGFloat)radius
                inContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, point.x, point.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect
{
    CGPoint midpoint;
    midpoint.x = self.bounds.origin.x + self.bounds.size.width / 2;
    midpoint.y = self.bounds.origin.y + self.bounds.size.height / 2;
    CGFloat size = self.bounds.size.width / 2;
    if (self.bounds.size.height < self.bounds.size.width)
        size = self.bounds.size.height / 2;
    size *= 0.90;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor] setStroke];
    [self drawCircleAtPoint:midpoint withRadius:size inContext:context];
    
    CGPoint eye;
    eye.x = midpoint.x - size * .35;
    eye.y = midpoint.y - size * .35;
    [self drawCircleAtPoint:eye withRadius:size * .1 inContext:context];
    eye.x += size * .35 * 2;
    [self drawCircleAtPoint:eye withRadius:size * .1 inContext:context];
    
    // draw mouth
    CGPoint mouthStart;
    mouthStart.x = midpoint.x - .45 * size;
    mouthStart.y = midpoint.y + .40 * size;
    CGPoint mouthEnd = mouthStart;
    mouthEnd.x += .45 * size * 2;
    CGPoint mouthCP1 = mouthStart;
    mouthCP1.x += .45 * size * 2 / 3;
    CGPoint mouthCP2 = mouthEnd;
    mouthCP2.x -= .45 * size * 2 / 3;
    float smile = [self.delegate smileForFaceView:self];
    if (smile < -1.0)
        smile = -1.0;
    if (smile > 1.0)
        smile = 1.0;
    CGFloat smileOffset = .25 * size * smile;
    mouthCP1.y += smileOffset;
    mouthCP2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(context,
                             mouthCP1.x, mouthCP1.y,
                             mouthCP2.x, mouthCP2.y,
                             mouthEnd.x, mouthEnd.y);
    CGContextStrokePath(context);
}

@end
