//
//  UIView+SFGesture.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIView+SFGesture.h"

@implementation UIView (SFGesture)

/// 添加单击手势
/// @param target 对象
/// @param action 事件
- (void)sf_addSingleTapWithTarget:(nullable id)target
                           action:(nullable SEL)action {
    [self sf_addTapWithTarget:target action:action numberOfTapsRequired:1];
}

/// 添加双击手势
/// @param target 对象
/// @param action 事件
- (void)sf_addDoubleTapWithTarget:(nullable id)target
                           action:(nullable SEL)action {
    [self sf_addTapWithTarget:target action:action numberOfTapsRequired:2];
}

/// 添加点击手势
/// @param target 对象
/// @param action 事件
/// @param numberOfTapsRequired 单击数
- (void)sf_addTapWithTarget:(nullable id)target
                     action:(nullable SEL)action
       numberOfTapsRequired:(NSUInteger)numberOfTapsRequired {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    tap.numberOfTapsRequired = numberOfTapsRequired;
    [self addGestureRecognizer:tap];
}


/// 添加长按手势
/// @param target 对象
/// @param action 事件
/// @param minDuration 最小时间
- (void)sf_addLongPressWithTarget:(nullable id)target
                           action:(nullable SEL)action
                      minDuration:(NSTimeInterval)minDuration {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:action];
    longPress.minimumPressDuration = minDuration;
    [self addGestureRecognizer:longPress];
}

@end
