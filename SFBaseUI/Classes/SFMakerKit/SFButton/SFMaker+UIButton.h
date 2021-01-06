//
//  SFMaker+UIButton.h
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIButton)

/// title
- (SFMaker* (^)(NSString *title))title;

/// titleForState
- (SFMaker* (^)(NSString *title, UIControlState state))titleForState;

/// titleColor
- (SFMaker* (^)(UIColor *color))titleColor;

/// titleColorForState
- (SFMaker* (^)(UIColor *color, UIControlState state))titleColorForState;

/// titleFont
- (SFMaker* (^)(UIFont *font))titleFont;

/// systemTitleFontSize
- (SFMaker* (^)(CGFloat size))systemTitleFontSize;

/// systemTitleFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemTitleFontSizeAndWeight;

/// boldSystemTitleFontSize
- (SFMaker* (^)(CGFloat size))boldSystemTitleFontSize;

/// image
- (SFMaker* (^)(UIImage *image))image;

/// imageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))imageForState;

/// backgroundImage
- (SFMaker* (^)(UIImage *image))backgroundImage;

/// backgroundImageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))backgroundImageForState;

/// contentEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))contentEdgeInsets;

/// titleEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))titleEdgeInsets;

/// imageEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))imageEdgeInsets;

/// addActionForEvent
- (SFMaker* (^)(id target, SEL sel, UIControlEvents events))addActionForEvent;

@end

NS_ASSUME_NONNULL_END
