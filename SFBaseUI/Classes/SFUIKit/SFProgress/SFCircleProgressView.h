//
//  SFCircleProgressView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/12.
//

#import "SFView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFCircleProgressView : SFView

/// 开始角度，默认(-M_PI_2)
@property (nonatomic,assign) IBInspectable CGFloat startAngle;
/// 结束角度，默认(M_PI_2*3)
@property (nonatomic,assign) IBInspectable CGFloat endAngle;
/// 宽度，默认(10)
@property (nonatomic,assign) IBInspectable CGFloat progressWidth;
/// 进度条颜色，默认orangeColor
@property (nonatomic,strong) IBInspectable UIColor *progressTintColor;
/// 进度条背景颜色，默认lightGrayColor
@property (nonatomic,strong) IBInspectable UIColor *trackTintColor;


/// 当前进度 0~1，默认0
@property (nonatomic,assign) float progress;

/// 动画方式设置进度
/// @param progress 进度
/// @param animated 是否需要动画
/// during默认1s，timingFunction默认Linear
- (void)setProgress:(float)progress animated:(BOOL)animated;

/// 动画方式设置进度
/// @param progress 进度
/// @param animated 是否需要动画
/// @param during 动画时长
/// timingFunction默认Linear
- (void)setProgress:(float)progress
           animated:(BOOL)animated
             during:(NSTimeInterval)during;

/// 动画方式设置进度
/// @param progress 进度
/// @param animated 是否需要动画
/// @param during 动画时长
/// @param timingFunction 动画方式
- (void)setProgress:(float)progress
           animated:(BOOL)animated
             during:(NSTimeInterval)during
     timingFunction:(CAMediaTimingFunctionName)timingFunction;

@end

NS_ASSUME_NONNULL_END
