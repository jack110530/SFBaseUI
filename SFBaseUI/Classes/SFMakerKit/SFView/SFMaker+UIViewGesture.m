//
//  SFMaker+UIViewGesture.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFMaker+UIViewGesture.h"

@implementation SFMaker (UIViewGesture)

/// 【UIView】addSingleTap
- (SFMaker* (^)(id target, SEL sel))addSingleTap {
    return ^SFMaker* (id target, SEL sel) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
            tap.numberOfTapsRequired = 1;
            [view addGestureRecognizer:tap];
        }
        return self;
    };
}

/// 【UIView】addDoubleTap
- (SFMaker* (^)(id target, SEL sel))addDoubleTap {
    return ^SFMaker* (id target, SEL sel) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
            tap.numberOfTapsRequired = 2;
            [view addGestureRecognizer:tap];
        }
        return self;
    };
}

/// 【UIView】addTapWithNum
- (SFMaker* (^)(id target, SEL sel, NSUInteger numberOfTapsRequired))addTapWithNum {
    return ^SFMaker* (id target, SEL sel, NSUInteger numberOfTapsRequired) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:sel];
            tap.numberOfTapsRequired = numberOfTapsRequired;
            [view addGestureRecognizer:tap];
        }
        return self;
    };
}

/// 【UIView】addLongPressWithDuration
- (SFMaker* (^)(id target, SEL sel, NSTimeInterval minimumPressDuration))addLongPressWithDuration {
    return ^SFMaker* (id target, SEL sel, NSTimeInterval minimumPressDuration) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.userInteractionEnabled = YES;
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:sel];
            longPress.minimumPressDuration = minimumPressDuration;
            [view addGestureRecognizer:longPress];
        }
        return self;
    };
}


@end
