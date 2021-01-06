//
//  SFMaker+UIButton.h
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIButton)

/// 【UIButton】title
- (SFMaker* (^)(NSString *title))title;

/// 【UIButton】titleForState
- (SFMaker* (^)(NSString *title, UIControlState state))titleForState;

/// 【UIButton】titleColor
- (SFMaker* (^)(UIColor *color))titleColor;

/// 【UIButton】titleColorForState
- (SFMaker* (^)(UIColor *color, UIControlState state))titleColorForState;

/// 【UIButton】titleFont
- (SFMaker* (^)(UIFont *font))titleFont;

/// 【UIButton】systemTitleFontSize
- (SFMaker* (^)(CGFloat size))systemTitleFontSize;

/// 【UIButton】systemTitleFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemTitleFontSizeAndWeight;

/// 【UIButton】boldSystemTitleFontSize
- (SFMaker* (^)(CGFloat size))boldSystemTitleFontSize;

/// 【UIButton】image
- (SFMaker* (^)(UIImage *image))image;

/// 【UIButton】imageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))imageForState;

/// 【UIButton】backgroundImage
- (SFMaker* (^)(UIImage *image))backgroundImage;

/// 【UIButton】backgroundImageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))backgroundImageForState;

/// 【UIButton】contentEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))contentEdgeInsets;

/// 【UIButton】titleEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))titleEdgeInsets;

/// 【UIButton】imageEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))imageEdgeInsets;

/// 【UIButton】addActionForEvent
- (SFMaker* (^)(id target, SEL sel, UIControlEvents events))addActionForEvent;

@end

NS_ASSUME_NONNULL_END
