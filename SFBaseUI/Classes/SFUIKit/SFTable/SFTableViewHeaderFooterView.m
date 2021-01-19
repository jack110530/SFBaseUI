//
//  SFTableViewHeaderFooterView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFTableViewHeaderFooterView.h"
#import <SFCategory/SFCategory.h>


@implementation SFTableViewHeaderFooterView

#pragma mark - init
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self customUI];
    }
    return self;
}

#pragma mark - custom ui
- (void)customUI {
    // 自定义UI
}

#pragma mark - custom layout
- (void)layoutSubviews {
    // 自定义布局
    [super layoutSubviews];
}

#pragma mark - 重用队列
+ (NSString *)sf_reuseIdentifier {
    return self.sf_className;
}
+ (BOOL)sf_loadFromNib {
    return NO;
}


@end
