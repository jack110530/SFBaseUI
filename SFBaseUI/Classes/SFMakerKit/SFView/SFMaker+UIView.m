//
//  SFMaker+UIView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFMaker+UIView.h"

@implementation SFMaker (UIView)

/// userInteractionEnabled
- (SFMaker* (^)(BOOL value))userInteractionEnabled {
    return ^SFMaker* (BOOL value) {
        if ([self.obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)self.obj;
            view.userInteractionEnabled = value;
        }
        return self;
    };
}

@end
