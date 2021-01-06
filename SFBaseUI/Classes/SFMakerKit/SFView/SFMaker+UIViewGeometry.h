//
//  SFMaker+UIViewGeometry.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewGeometry)

/// frame
- (SFMaker* (^)(CGRect frame))frame;

/// origin
- (SFMaker* (^)(CGPoint origin))origin;

/// x
- (SFMaker* (^)(CGFloat x))x;

/// y
- (SFMaker* (^)(CGFloat x))y;

/// size
- (SFMaker* (^)(CGSize size))size;

/// width
- (SFMaker* (^)(CGFloat width))width;

/// height
- (SFMaker* (^)(CGFloat height))height;

/// center
- (SFMaker* (^)(CGPoint center))center;

/// centerX
- (SFMaker* (^)(CGFloat centerX))centerX;

/// centerY
- (SFMaker* (^)(CGFloat centerY))centerY;

@end

NS_ASSUME_NONNULL_END
