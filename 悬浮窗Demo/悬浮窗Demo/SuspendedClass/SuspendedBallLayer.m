//
//  SuspendedBallLayer.m
//  SuspendedBall
//
//  Created by chenpeng on 15/11/6.
//  Copyright © 2015年 chenpeng. All rights reserved.
//

#import "SuspendedBallLayer.h"
@interface SuspendedBallLayer()
{
    CGFloat offsetX;
    CGFloat waterWaveHeight;
    CGFloat waterWaveWidth;
}
@property(nonatomic,strong)CADisplayLink *displayLink;
@property(nonatomic,strong) UILabel *label;

@end
@implementation SuspendedBallLayer

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    waterWaveHeight = frame.size.height;
    waterWaveWidth  = frame.size.width;
}

-(void)setProgress:(CGFloat)progress
{
    waterWaveHeight = progress * self.frame.size.height;
    if (progress == 0.0f) {
    }else{
        [self wave];
    }
}

-(void)wave
{
    if (self.displayLink == nil) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

-(void)stop{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

-(void)getCurrentWave:(CADisplayLink *)displayLink
{
    offsetX += self.waveSpeed;
    self.path = [self getgetCurrentWavePath];
}

-(CGPathRef)getgetCurrentWavePath
{
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, waterWaveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  waterWaveWidth ; x++) {
        y = self.waveAmplitude* sinf((360/waterWaveWidth) *(x * M_PI / 180) - offsetX * M_PI / 180) + waterWaveHeight;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    p.CGPath = path;
    return path;
}
@end
