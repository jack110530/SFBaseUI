//
//  SFCircleProgressView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/12.
//

#import "SFCircleProgressView.h"
#import <SFMacro/SFFunc.h>
#import <SFCrashInspector/SFProxy.h>

#define SFDefault_startAngle        (-M_PI_2)
#define SFDefault_endAngle          (M_PI_2*3)
#define SFDefault_progressWidth     (10)
#define SFDefault_progressTintColor [UIColor orangeColor]
#define SFDefault_trackTintColor    [UIColor lightGrayColor]

@interface SFCircleProgressView ()

@property (nonatomic,strong) CAShapeLayer *trackLayer;
@property (nonatomic,strong) CAShapeLayer *progressLayer;

@end

IB_DESIGNABLE
@implementation SFCircleProgressView

#pragma mark - init
- (void)customUI {
    self.progressWidth = SFDefault_progressWidth;
    self.progressTintColor = SFDefault_progressTintColor;
    self.trackTintColor = SFDefault_trackTintColor;
    [self.layer addSublayer:self.trackLayer];
    [self.layer addSublayer:self.progressLayer];
}
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [self getPathWithRect:rect];
    self.trackLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
}

#pragma mark - func
- (UIBezierPath *)getPathWithRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    CGFloat progressWidth = (self.progressWidth==0)?SFDefault_progressWidth:self.progressWidth;
    CGFloat radius = rect.size.width/2.0-progressWidth;
    CGFloat startAngle = (self.startAngle==0)?SFDefault_startAngle:self.startAngle;
    CGFloat endAngle = (self.endAngle==0)?SFDefault_endAngle:self.endAngle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    return path;
}
// MARK: 进度
- (void)setProgress:(float)progress {
    [self setProgress:progress animated:NO];
}
- (void)setProgress:(float)progress animated:(BOOL)animated {
    [self setProgress:progress animated:animated during:1];
}
- (void)setProgress:(float)progress animated:(BOOL)animated during:(NSTimeInterval)during {
    [self setProgress:progress animated:animated during:1 timingFunction:kCAMediaTimingFunctionLinear];
}
- (void)setProgress:(float)progress animated:(BOOL)animated during:(NSTimeInterval)during timingFunction:(CAMediaTimingFunctionName)timingFunction {
    if (progress < 0) {
        progress = 0;
    }
    if (progress > 1) {
        progress = 1;
    }
    float fromProgress = _progress;
    _progress = progress;
    float toProgress = _progress;
    [self.progressLayer removeAllAnimations];
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fromValue = [NSNumber numberWithFloat:fromProgress];
    anim.toValue = [NSNumber numberWithFloat:toProgress];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.beginTime = CACurrentMediaTime() + 0;
    anim.duration = animated?during:0.1;
    anim.repeatCount = 1;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    [self.progressLayer addAnimation:anim forKey:@"anim_grow"];
}


#pragma mark - setter
- (void)setProgressWidth:(CGFloat)progressWidth {
    _progressWidth = progressWidth;
    self.trackLayer.lineWidth = progressWidth;
    self.progressLayer.lineWidth = progressWidth;
}
- (void)setProgressTintColor:(UIColor *)progressTintColor {
    _progressTintColor = progressTintColor;
    self.progressLayer.strokeColor = progressTintColor.CGColor;
}
- (void)setTrackTintColor:(UIColor *)trackTintColor {
    _trackTintColor = trackTintColor;
    self.trackLayer.strokeColor = trackTintColor.CGColor;
}


#pragma mark - getter
SFLazyLoad(CAShapeLayer, trackLayer, {
    _trackLayer = [CAShapeLayer layer];
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
})
SFLazyLoad(CAShapeLayer, progressLayer, {
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
})



@end
