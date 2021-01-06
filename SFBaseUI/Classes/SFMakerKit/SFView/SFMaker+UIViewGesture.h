//
//  SFMaker+UIViewGesture.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <SFBaseUI/SFBaseUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFMaker (UIViewGesture)

/// addSingleTap
- (SFMaker* (^)(id target, SEL sel))addSingleTap;

/// addDoubleTap
- (SFMaker* (^)(id target, SEL sel))addDoubleTap;

/// addTapWithNum
- (SFMaker* (^)(id target, SEL sel, NSUInteger numberOfTapsRequired))addTapWithNum;

/// addLongPressWithDuration
- (SFMaker* (^)(id target, SEL sel, NSTimeInterval minimumPressDuration))addLongPressWithDuration;

@end

NS_ASSUME_NONNULL_END
