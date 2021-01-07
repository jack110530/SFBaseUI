//
//  SFView.m
//  SFBaseUI-SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFView.h"

@implementation SFView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self customUI];
    }
    return self;
}

#pragma mark - custom ui
- (void)customUI {
    // 自定义UI
}

#pragma mark - customLayout
- (void)layoutSubviews {
    // 自定义布局
    [super layoutSubviews];
}


@end
