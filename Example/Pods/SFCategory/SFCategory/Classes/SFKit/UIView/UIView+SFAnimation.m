//
//  UIView+SFAnimation.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIView+SFAnimation.h"

@implementation UIView (SFAnimation)

/// 动态添加
/// @param subview 子视图
/// @param transition 动画类型
/// @param duration 动画时间
-(void)sf_addSubview:(UIView *)subview
          transition:(UIViewAnimationTransition)transition
            duration: (NSTimeInterval)duration {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:transition forView:self cache:YES];
    [self addSubview:subview];
    [UIView commitAnimations];
}


/// 动态移除
/// @param transition 动画类型
/// @param duration 动画时间
-(void)sf_removeFromSuperviewWithTransition:(UIViewAnimationTransition)transition
                                   duration: (NSTimeInterval)duration {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:transition forView:self.superview cache:YES];
    [self removeFromSuperview];
    [UIView commitAnimations];
}

@end
