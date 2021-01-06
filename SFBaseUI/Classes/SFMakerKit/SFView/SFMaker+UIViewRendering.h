//
//  SFMaker+UIViewRendering.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewRendering)

/// clipsToBounds
- (SFMaker* (^)(BOOL value))clipsToBounds;

/// backgroundColor
- (SFMaker* (^)(UIColor *value))backgroundColor;

/// alpha
- (SFMaker* (^)(CGFloat value))alpha;

/// opaque
- (SFMaker* (^)(BOOL value))opaque;

/// hidden
- (SFMaker* (^)(BOOL value))hidden;

/// contentMode
- (SFMaker* (^)(UIViewContentMode value))contentMode;

/// maskView
- (SFMaker* (^)(UIView *value))maskView;

/// tintColor
- (SFMaker* (^)(UIColor *value))tintColor;

@end

NS_ASSUME_NONNULL_END
