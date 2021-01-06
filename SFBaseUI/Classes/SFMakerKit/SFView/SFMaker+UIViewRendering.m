//
//  SFMaker+UIViewRendering.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker+UIViewRendering.h"

@implementation SFMaker (UIViewRendering)

/// 【UIView】clipsToBounds
- (SFMaker* (^)(BOOL value))clipsToBounds {
    return ^SFMaker* (BOOL value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.clipsToBounds = value;
        }
        return self;
    };
}

/// 【UIView】backgroundColor
- (SFMaker* (^)(UIColor *value))backgroundColor {
    return ^SFMaker* (UIColor *value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.backgroundColor = value;
        }
        return self;
    };
}

/// 【UIView】alpha
- (SFMaker* (^)(CGFloat value))alpha {
    return ^SFMaker* (CGFloat value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.alpha = value;
        }
        return self;
    };
}

/// 【UIView】opaque
- (SFMaker* (^)(BOOL value))opaque {
    return ^SFMaker* (BOOL value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.opaque = value;
        }
        return self;
    };
}

/// 【UIView】hidden
- (SFMaker* (^)(BOOL value))hidden {
    return ^SFMaker* (BOOL value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.hidden = value;
        }
        return self;
    };
}

/// 【UIView】contentMode
- (SFMaker* (^)(UIViewContentMode value))contentMode {
    return ^SFMaker* (UIViewContentMode value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.contentMode = value;
        }
        return self;
    };
}

/// 【UIView】maskView
- (SFMaker* (^)(UIView *value))maskView {
    return ^SFMaker* (UIView *value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.maskView = value;
        }
        return self;
    };
}

/// 【UIView】tintColor
- (SFMaker* (^)(UIColor *value))tintColor {
    return ^SFMaker* (UIColor *value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.tintColor = value;
        }
        return self;
    };
}


@end
