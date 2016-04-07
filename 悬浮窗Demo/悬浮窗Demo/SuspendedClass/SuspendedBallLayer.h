//
//  SuspendedBallLayer.h
//  SuspendedBall
//
//  Created by chenpeng on 15/11/6.
//  Copyright © 2015年 chenpeng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface SuspendedBallLayer : CAShapeLayer

@property (nonatomic,assign)CGFloat waveSpeed;

@property (nonatomic,assign)CGFloat waveAmplitude;

@property (nonatomic,assign)CGFloat progress;

-(void) wave;

-(void) stop;
@end
