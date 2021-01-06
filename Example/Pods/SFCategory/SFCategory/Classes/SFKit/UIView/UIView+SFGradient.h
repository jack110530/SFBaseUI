//
//  UIView+SFGradient.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SFGradient)

/// 新增颜色渐变层
/// @param colors 颜色数组
/// @param locations 位置数组 0~1
/// @param startPoint 起始位置 (0, 0) ~ (1, 1)
/// @param endPoint 结束位置 (0, 0) ~ (1, 1)
- (void)sf_addGradientWithColors:(NSArray *)colors
                       locations:(NSArray *)locations
                      startPoint:(CGPoint)startPoint
                        endPoint:(CGPoint)endPoint;

/// 移除颜色渐变层
- (void)sf_removeGradient;

@end

NS_ASSUME_NONNULL_END
