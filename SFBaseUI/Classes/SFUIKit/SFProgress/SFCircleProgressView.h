//
//  SFCircleProgressView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/12.
//

#import "SFView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFCircleProgressView : SFView

/// 当前进度 0~1，默认0
@property (nonatomic,assign) IBInspectable float progress;

/// 开始角度，默认(-M_PI_2)
@property (nonatomic,assign) IBInspectable CGFloat startAngle;
/// 结束角度，默认(M_PI_2*3)
@property (nonatomic,assign) IBInspectable CGFloat endAngle;
/// 宽度，默认(10)
@property (nonatomic,assign) IBInspectable CGFloat progressWidth;
/// 进度条颜色，默认orangeColor
@property (nonatomic,strong) IBInspectable UIColor *progressTintColor;
/// 进度条背景颜色，默认grayColor
@property (nonatomic,strong) IBInspectable UIColor *trackTintColor;


@end

NS_ASSUME_NONNULL_END
