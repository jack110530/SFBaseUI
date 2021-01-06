//
//  SFMaker+UIViewGesture.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <SFBaseUI/SFBaseUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewGesture)

/// 【UIView】addSingleTap
- (SFMaker* (^)(id target, SEL sel))addSingleTap;

/// 【UIView】addDoubleTap
- (SFMaker* (^)(id target, SEL sel))addDoubleTap;

/// 【UIView】addTapWithNum
- (SFMaker* (^)(id target, SEL sel, NSUInteger numberOfTapsRequired))addTapWithNum;

/// 【UIView】addLongPressWithDuration
- (SFMaker* (^)(id target, SEL sel, NSTimeInterval minimumPressDuration))addLongPressWithDuration;

@end

NS_ASSUME_NONNULL_END
