//
//  UIView+SFGradient.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIView+SFGradient.h"
#import <objc/runtime.h>

@interface UIView ()
@property (nonatomic,strong) CAGradientLayer *gradientLayer;
@end

@implementation UIView (SFGradient)

/// 新增颜色渐变层
/// @param colors 颜色数组
/// @param locations 位置数组 0~1
/// @param startPoint 起始位置 (0, 0) ~ (1, 1)
/// @param endPoint 结束位置 (0, 0) ~ (1, 1)
- (void)sf_addGradientWithColors:(NSArray *)colors
                       locations:(NSArray *)locations
                      startPoint:(CGPoint)startPoint
                        endPoint:(CGPoint)endPoint {
    if (self.gradientLayer) {
        [self.gradientLayer removeFromSuperlayer];
    }
    self.gradientLayer = [CAGradientLayer layer];
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        id cgColor = (__bridge id)color.CGColor;
        [cgColors addObject:cgColor];
    }
    self.gradientLayer.colors = cgColors.copy;
    self.gradientLayer.locations = locations;
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
    self.gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

/// 移除颜色渐变层
- (void)sf_removeGradient {
    if (self.gradientLayer) {
        [self.gradientLayer removeFromSuperlayer];
    }
}

#pragma mark - title
- (void)setGradientLayer:(CAGradientLayer *)gradientLayer {
    objc_setAssociatedObject(self, @selector(gradientLayer), gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CAGradientLayer *)gradientLayer {
    return objc_getAssociatedObject(self, @selector(gradientLayer));
}

@end
