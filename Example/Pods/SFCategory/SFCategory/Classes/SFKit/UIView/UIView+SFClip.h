//
//  UIView+SFClip.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SFClip)

/// 设置圆角
/// @param radius 圆角半径
- (void)sf_setRoundedCornerWithRadius:(CGFloat)radius;

/// 设置边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
- (void)sf_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor;

/// 设置圆角+边框
/// @param radius 圆角半径
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
- (void)sf_setRoundedCornerWithRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

/// 设置指定圆角
/// @param corners 位置
/// @param radius 半径
- (void)sf_setCustomCornerAt:(UIRectCorner)corners
                      radius:(CGFloat)radius;

/// 设置阴影
/// @param color 阴影颜色
/// @param offset 偏移量
/// @param opacity 透明度
/// @param radius 半径
-(void)sf_setShadowWithColor:(UIColor *)color
                      offset: (CGSize)offset
                     opacity: (CGFloat)opacity
                      radius: (CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
