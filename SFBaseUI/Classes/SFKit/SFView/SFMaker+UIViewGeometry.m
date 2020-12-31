//
//  SFMaker+UIViewGeometry.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker+UIViewGeometry.h"

@implementation SFMaker (UIViewGeometry)

/// frame
- (SFMaker* (^)(CGRect frame))frame {
    return ^SFMaker* (CGRect frame) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.frame = frame;
        }
        return self;
    };
}

/// origin
- (SFMaker* (^)(CGPoint origin))origin {
    return ^SFMaker* (CGPoint origin) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.origin = origin;
            view.frame = frame;
        }
        return self;
    };
}

/// x
- (SFMaker* (^)(CGFloat x))x {
    return ^SFMaker* (CGFloat x) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.origin.x = x;
            view.frame = frame;
        }
        return self;
    };
}

/// y
- (SFMaker* (^)(CGFloat x))y {
    return ^SFMaker* (CGFloat y) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.origin.y = y;
            view.frame = frame;
        }
        return self;
    };
}

/// size
- (SFMaker* (^)(CGSize size))size {
    return ^SFMaker* (CGSize size) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.size = size;
            view.frame = frame;
        }
        return self;
    };
}

/// width
- (SFMaker* (^)(CGFloat width))width {
    return ^SFMaker* (CGFloat width) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.size.width = width;
            view.frame = frame;
        }
        return self;
    };
}

/// height
- (SFMaker* (^)(CGFloat height))height {
    return ^SFMaker* (CGFloat height) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            CGRect frame = view.frame;
            frame.size.height = height;
            view.frame = frame;
        }
        return self;
    };
}

/// center
- (SFMaker* (^)(CGPoint center))center {
    return ^SFMaker* (CGPoint center) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.center = center;
        }
        return self;
    };
}

/// centerX
- (SFMaker* (^)(CGFloat centerX))centerX {
    return ^SFMaker* (CGFloat centerX) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.center = CGPointMake(centerX, view.center.y);
        }
        return self;
    };
}

/// centerY
- (SFMaker* (^)(CGFloat centerY))centerY {
    return ^SFMaker* (CGFloat centerY) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.center = CGPointMake(view.center.x, centerY);
        }
        return self;
    };
}


@end
