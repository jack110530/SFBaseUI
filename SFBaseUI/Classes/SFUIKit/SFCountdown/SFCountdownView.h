//
//  SFCountdownView.h
//  SFTool
//
//  Created by 黄山锋 on 2021/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFCountdownView : UIView

/**
 * 【规则】
 * 假定：
 * 当前剩余时间为t
 * 显示截止时间的最小剩余时间为t1，默认t1 = 3*24*3600（3天）
 * 显示天数+时分秒的最小剩余时间为t2，默认t2 = 1*24*3600（1天）
 * 显示时分秒的最小剩余时间为t3=0
 * t <= t3 时，则显示“已结束”
 *
 * t >= t1 则显示截止时间（即：yyyy/MM/dd HH:mm:ss截止）
 * t < t1 && t  >= t2 则显示天数（即：dd天 dd天 HH:mm:ss）
 * t < t2 && t >= t3  则不显示天数（即：dd天 HH:mm:ss）
 * t < t3 则显示“已结束”
 */

/// 默认：t1 = 3*24*3600（3天）
@property (nonatomic, assign) NSTimeInterval t1;
/// 默认：t2 = 1*24*3600（1天）
@property (nonatomic, assign) NSTimeInterval t2;
/// 恒等于0
@property (nonatomic, assign, readonly) NSTimeInterval t3;

/// 默认：yyyy/MM/dd HH:mm:ss截止
@property (nonatomic,copy) NSString *fmt_deadline;
/// 默认：@"天 "
@property (nonatomic,copy) NSString *fmt_day;
/// 默认：@"时"
@property (nonatomic,copy) NSString *fmt_hour;
/// 默认：@"分"
@property (nonatomic,copy) NSString *fmt_minute;
/// 默认：@"秒"
@property (nonatomic,copy) NSString *fmt_seconds;
/// 默认：@“已结束”
@property (nonatomic,copy) NSString *fmt_exceeded;

/// 天数颜色（如，2天 12:30:05中的“2”）默认：红色
@property (nonatomic,strong) UIColor *dayColor;
/// 天数单位颜色（如，2天 12:30:05中的“天”）默认：红色
@property (nonatomic,strong) UIColor *dayUnitColor;
/// 倒计时颜色（如，12:30:05中的数字，时分秒），默认：白色
@property (nonatomic,strong) UIColor *hmsColor;
/// 倒计时单位颜色（如，2天 12:30:05中的“:”，时分秒），默认：黑色
@property (nonatomic,strong) UIColor *hmsUnitColor;

/// 截止时间颜色，默认：黑色
@property (nonatomic,strong) UIColor *deadlineColor;
/// 已结束颜色，默认：灰色
@property (nonatomic,strong) UIColor *exceededColor;


/// 字体，默认：系统17（如果设置了改属性，则其他字体的默认font都为该属性值，如dayFont，dayUnitFont等等）
@property (nonatomic,strong) UIFont *font;
/// 天数字体，默认：系统bold 17
@property (nonatomic,strong) UIFont *dayFont;
/// 天数单位字体，默认：系统17
@property (nonatomic,strong) UIFont *dayUnitFont;
/// 倒计时字体，默认：系统17
@property (nonatomic,strong) UIFont *hmsFont;
/// 倒计时单位字体，默认：系统17
@property (nonatomic,strong) UIFont *hmsUnitFont;
/// 截止时间字体，默认：系统17
@property (nonatomic,strong) UIFont *deadlineFont;
/// 已结束字体，默认：系统17
@property (nonatomic,strong) UIFont *exceededFont;


/// 间距，默认8
@property (nonatomic,assign) CGFloat cellPadding;
/// 圆角，默认5
@property (nonatomic,assign) CGFloat cellCorner;


/// 截止时间戳（单位：秒）
@property (nonatomic, assign) NSTimeInterval deadline;


// MARK: 回调
@property (nonatomic,copy) void (^countdownDidFinishedBlock)(void);

@end

@interface SFCountdownCell : UIView
@property (nonatomic,strong) UILabel *valueLabel;
@end

NS_ASSUME_NONNULL_END
