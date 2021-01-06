//
//  UIView+SFClip.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIView+SFClip.h"

@implementation UIView (SFClip)

/// 设置圆角
/// @param radius 圆角半径
- (void)sf_setRoundedCornerWithRadius:(CGFloat)radius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

/// 设置边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
- (void)sf_setBorderWidth:(CGFloat)borderWidth
              borderColor:(UIColor *)borderColor {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

/// 设置圆角+边框
/// @param radius 圆角半径
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
- (void)sf_setRoundedCornerWithRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

/// 设置指定圆角
/// @param corners 位置
/// @param radius 半径
- (void)sf_setCustomCornerAt:(UIRectCorner)corners
                      radius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius,radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/// 设置阴影
/// @param color 阴影颜色
/// @param offset 偏移量
/// @param opacity 透明度
/// @param radius 半径
-(void)sf_setShadowWithColor:(UIColor *)color
                      offset: (CGSize)offset
                     opacity: (CGFloat)opacity
                      radius: (CGFloat)radius {
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

@end
