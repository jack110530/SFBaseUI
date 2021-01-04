//
//  UIButton+SFMaker.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/31.
//

#import "UIButton+SFMaker.h"

@implementation UIButton (SFMaker)

+ (SFMaker* (^)(UIButtonType type))makeWithType {
    return ^SFMaker* (UIButtonType type) {
        UIButton *btn = [UIButton buttonWithType:type];
        return btn.maker;
    };
}

@end
