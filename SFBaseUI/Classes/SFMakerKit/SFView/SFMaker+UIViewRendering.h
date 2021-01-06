//
//  SFMaker+UIViewRendering.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewRendering)

/// 【UIView】clipsToBounds
- (SFMaker* (^)(BOOL value))clipsToBounds;

/// 【UIView】backgroundColor
- (SFMaker* (^)(UIColor *value))backgroundColor;

/// 【UIView】alpha
- (SFMaker* (^)(CGFloat value))alpha;

/// 【UIView】opaque
- (SFMaker* (^)(BOOL value))opaque;

/// 【UIView】hidden
- (SFMaker* (^)(BOOL value))hidden;

/// 【UIView】contentMode
- (SFMaker* (^)(UIViewContentMode value))contentMode;

/// 【UIView】maskView
- (SFMaker* (^)(UIView *value))maskView;

/// 【UIView】tintColor
- (SFMaker* (^)(UIColor *value))tintColor;

@end

NS_ASSUME_NONNULL_END
