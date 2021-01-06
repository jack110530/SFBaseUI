//
//  SFMaker+UIViewGeometry.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewGeometry)

/// 【UIView】frame
- (SFMaker* (^)(CGRect frame))frame;

/// 【UIView】origin
- (SFMaker* (^)(CGPoint origin))origin;

/// 【UIView】x
- (SFMaker* (^)(CGFloat x))x;

/// 【UIView】y
- (SFMaker* (^)(CGFloat x))y;

/// 【UIView】size
- (SFMaker* (^)(CGSize size))size;

/// 【UIView】width
- (SFMaker* (^)(CGFloat width))width;

/// 【UIView】height
- (SFMaker* (^)(CGFloat height))height;

/// 【UIView】center
- (SFMaker* (^)(CGPoint center))center;

/// 【UIView】centerX
- (SFMaker* (^)(CGFloat centerX))centerX;

/// 【UIView】centerY
- (SFMaker* (^)(CGFloat centerY))centerY;

@end

NS_ASSUME_NONNULL_END
