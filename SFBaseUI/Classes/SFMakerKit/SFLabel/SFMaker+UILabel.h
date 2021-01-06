//
//  SFMaker+UILabel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UILabel)

/// 【UILabel】text
- (SFMaker* (^)(NSString *value))text;

/// 【UILabel】font
- (SFMaker* (^)(UIFont *value))font;

/// 【UILabel】systemFontSize
- (SFMaker* (^)(CGFloat size))systemFontSize;

/// 【UILabel】systemFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemFontSizeAndWeight;

/// 【UILabel】boldSystemFontSize
- (SFMaker* (^)(CGFloat size))boldSystemFontSize;

/// 【UILabel】textColor
- (SFMaker* (^)(UIColor *value))textColor;

/// 【UILabel】textAlignment
- (SFMaker* (^)(NSTextAlignment value))textAlignment;

/// 【UILabel】numberOfLines
- (SFMaker* (^)(NSInteger value))numberOfLines;

@end

NS_ASSUME_NONNULL_END
