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
#define SFDefault_trackTintColor    [UIColor grayColor]

@interface SFCircleProgressView ()

@property (nonatomic,strong) CAShapeLayer *trackLayer;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (nonatomic,assign) BOOL isDrawed;

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
    UIBezierPath *path = [self getPathWithRect:rect progress:1];
    self.trackLayer.path = path.CGPath;
    if (!self.isDrawed) {
        UIBezierPath *path = [self getPathWithRect:self.bounds progress:self.progress];
        self.progressLayer.path = path.CGPath;
        self.isDrawed = YES;
    }
}

#pragma mark - func
- (UIBezierPath *)getPathWithRect:(CGRect)rect progress:(float)progress {
    CGPoint center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    CGFloat progressWidth = (self.progressWidth==0)?SFDefault_progressWidth:self.progressWidth;
    CGFloat radius = rect.size.width/2.0-progressWidth;
    CGFloat startAngle = (self.startAngle==0)?SFDefault_startAngle:self.startAngle;
    CGFloat endAngle = (self.endAngle==0)?SFDefault_endAngle:self.endAngle;
    CGFloat allAngle = endAngle - startAngle;
    CGFloat progressAngle = allAngle*progress + startAngle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:progressAngle clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    return path;
}


#pragma mark - setter
- (void)setProgress:(float)progress {
    _progress = progress;
    if (self.isDrawed) {
        UIBezierPath *path = [self getPathWithRect:self.bounds progress:progress];
        self.progressLayer.path = path.CGPath;
    }else{
        [self setNeedsDisplay];
    }
}
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
