//
//  SFCollectionReusableView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionReusableView.h"
#import <SFCategory/NSObject+SFExtension.h>

@implementation SFCollectionReusableView

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
