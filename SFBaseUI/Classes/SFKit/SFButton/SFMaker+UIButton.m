//
//  SFMaker+UIButton.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker+UIButton.h"

@implementation SFMaker (UIButton)

/// title
- (SFMaker* (^)(NSString *title))title {
    return ^SFMaker* ((NSString *title)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitle:title forState:UIControlStateNormal];
        }
        return self;
    };
}

/// titleForState
- (SFMaker* (^)(NSString *title, UIControlState state))titleForState {
    return ^SFMaker* ((NSString *title, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitle:title forState:state];
        }
        return self;
    };
}

/// titleColor
- (SFMaker* (^)(UIColor *color))titleColor {
    return ^SFMaker* ((UIColor *color)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitleColor:color forState:UIControlStateNormal];
        }
        return self;
    };
}

/// titleColorForState
- (SFMaker* (^)(UIColor *color, UIControlState state))titleColorForState {
    return ^SFMaker* ((UIColor *color, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitleColor:color forState:state];
        }
        return self;
    };
}

/// titleFont
- (SFMaker* (^)(UIFont *font))titleFont {
    return ^SFMaker* ((UIFont *font)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = font;
        }
        return self;
    };
}

/// systemTitleFontSize
- (SFMaker* (^)(CGFloat size))systemTitleFontSize {
    return ^SFMaker* ((CGFloat size)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:size];
        }
        return self;
    };
}

/// systemTitleFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemTitleFontSizeAndWeight {
    return ^SFMaker* ((CGFloat size, UIFontWeight weight)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:size weight:weight];
        }
        return self;
    };
}

/// boldSystemTitleFontSize
- (SFMaker* (^)(CGFloat size))boldSystemTitleFontSize {
    return ^SFMaker* ((CGFloat size)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:size];
        }
        return self;
    };
}


/// image
- (SFMaker* (^)(UIImage *image))image {
    return ^SFMaker* ((UIImage *image)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setImage:image forState:UIControlStateNormal];
        }
        return self;
    };
}

/// imageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))imageForState {
    return ^SFMaker* ((UIImage *image, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setImage:image forState:state];
        }
        return self;
    };
}

/// backgroundImage
- (SFMaker* (^)(UIImage *image))backgroundImage {
    return ^SFMaker* ((UIImage *image)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setBackgroundImage:image forState:UIControlStateNormal];
        }
        return self;
    };
}

/// backgroundImageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))backgroundImageForState {
    return ^SFMaker* ((UIImage *image, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setBackgroundImage:image forState:state];
        }
        return self;
    };
}

/// contentEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))contentEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.contentEdgeInsets = inserts;
        }
        return self;
    };
}

/// titleEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))titleEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleEdgeInsets = inserts;
        }
        return self;
    };
}

/// imageEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))imageEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.imageEdgeInsets = inserts;
        }
        return self;
    };
}



@end
