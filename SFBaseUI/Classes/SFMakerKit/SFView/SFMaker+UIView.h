//
//  SFMaker+UIView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIView)

/// 【UIView】userInteractionEnabled
- (SFMaker* (^)(BOOL value))userInteractionEnabled;

@end

NS_ASSUME_NONNULL_END
