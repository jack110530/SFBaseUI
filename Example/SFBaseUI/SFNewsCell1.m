//
//  SFNewsCell1.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsCell1.h"
#import <SFMacro/SFMacro.h>
#import <Masonry/Masonry.h>

@interface SFNewsCell1 ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation SFNewsCell1

+ (BOOL)sf_loadFromNib {
    return NO;
}

#pragma mark - custom ui
- (void)customUI {
    [super customUI];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
    }];
}

#pragma mark - custom layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
}


#pragma mark - setter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}
- (void)setDesc:(NSString *)desc {
    _desc = desc;
    self.descLabel.text = desc;
}


#pragma mark - getter
SFLazyLoad(UILabel, titleLabel, {
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _titleLabel.textColor = [UIColor blackColor];
})
SFLazyLoad(UILabel, descLabel, {
    _descLabel = [[UILabel alloc]init];
    _descLabel.font = [UIFont systemFontOfSize:15];
    _descLabel.textColor = [UIColor darkTextColor];
    _descLabel.numberOfLines = 0;
})

@end
