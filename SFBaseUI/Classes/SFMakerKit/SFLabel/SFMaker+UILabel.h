//
//  SFMaker+UILabel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UILabel)

/// text
- (SFMaker* (^)(NSString *value))text;

/// font
- (SFMaker* (^)(UIFont *value))font;

/// textColor
- (SFMaker* (^)(UIColor *value))textColor;

/// textAlignment
- (SFMaker* (^)(NSTextAlignment value))textAlignment;

/// numberOfLines
- (SFMaker* (^)(NSInteger value))numberOfLines;

@end

NS_ASSUME_NONNULL_END
