//
//  SFMaker+UIButton.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "SFMaker+UIButton.h"

@implementation SFMaker (UIButton)

/// 【UIButton】title
- (SFMaker* (^)(NSString *title))title {
    return ^SFMaker* ((NSString *title)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitle:title forState:UIControlStateNormal];
        }
        return self;
    };
}

/// 【UIButton】titleForState
- (SFMaker* (^)(NSString *title, UIControlState state))titleForState {
    return ^SFMaker* ((NSString *title, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitle:title forState:state];
        }
        return self;
    };
}

/// 【UIButton】titleColor
- (SFMaker* (^)(UIColor *color))titleColor {
    return ^SFMaker* ((UIColor *color)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitleColor:color forState:UIControlStateNormal];
        }
        return self;
    };
}

/// 【UIButton】titleColorForState
- (SFMaker* (^)(UIColor *color, UIControlState state))titleColorForState {
    return ^SFMaker* ((UIColor *color, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setTitleColor:color forState:state];
        }
        return self;
    };
}

/// 【UIButton】titleFont
- (SFMaker* (^)(UIFont *font))titleFont {
    return ^SFMaker* ((UIFont *font)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = font;
        }
        return self;
    };
}

/// 【UIButton】systemTitleFontSize
- (SFMaker* (^)(CGFloat size))systemTitleFontSize {
    return ^SFMaker* ((CGFloat size)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:size];
        }
        return self;
    };
}

/// 【UIButton】systemTitleFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemTitleFontSizeAndWeight {
    return ^SFMaker* ((CGFloat size, UIFontWeight weight)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont systemFontOfSize:size weight:weight];
        }
        return self;
    };
}

/// 【UIButton】boldSystemTitleFontSize
- (SFMaker* (^)(CGFloat size))boldSystemTitleFontSize {
    return ^SFMaker* ((CGFloat size)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:size];
        }
        return self;
    };
}


/// 【UIButton】image
- (SFMaker* (^)(UIImage *image))image {
    return ^SFMaker* ((UIImage *image)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setImage:image forState:UIControlStateNormal];
        }
        return self;
    };
}

/// 【UIButton】imageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))imageForState {
    return ^SFMaker* ((UIImage *image, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setImage:image forState:state];
        }
        return self;
    };
}

/// 【UIButton】backgroundImage
- (SFMaker* (^)(UIImage *image))backgroundImage {
    return ^SFMaker* ((UIImage *image)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setBackgroundImage:image forState:UIControlStateNormal];
        }
        return self;
    };
}

/// 【UIButton】backgroundImageForState
- (SFMaker* (^)(UIImage *image, UIControlState state))backgroundImageForState {
    return ^SFMaker* ((UIImage *image, UIControlState state)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn setBackgroundImage:image forState:state];
        }
        return self;
    };
}

/// 【UIButton】contentEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))contentEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.contentEdgeInsets = inserts;
        }
        return self;
    };
}

/// 【UIButton】titleEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))titleEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.titleEdgeInsets = inserts;
        }
        return self;
    };
}

/// 【UIButton】imageEdgeInsets
- (SFMaker* (^)(UIEdgeInsets inserts))imageEdgeInsets {
    return ^SFMaker* ((UIEdgeInsets inserts)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            btn.imageEdgeInsets = inserts;
        }
        return self;
    };
}

/// 【UIButton】addActionForEvent
- (SFMaker* (^)(id target, SEL sel, UIControlEvents events))addActionForEvent {
    return ^SFMaker* ((id target, SEL sel, UIControlEvents events)) {
        if ([self.obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.obj;
            [btn addTarget:target action:sel forControlEvents:events];
        }
        return self;
    };
}



@end
