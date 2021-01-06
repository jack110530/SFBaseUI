//
//  UIImage+SFExtension.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SFExtension)

#pragma mark - color
/// 由颜色生成图片
/// @param color 颜色
+ (UIImage *)sf_imageWithColor:(UIColor *)color;


#pragma mark - gif
/// gif动图（data）
+ (UIImage *)sf_gifWithData:(NSData *)data;

/// gif动图（name）
+ (UIImage *)sf_gifNamed:(NSString *)name;


#pragma mark - resize
- (UIImage *)sf_imageByScalingAndCroppingToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
