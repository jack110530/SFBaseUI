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
#import <ReactiveObjC/ReactiveObjC.h>

@interface SFNewsCell1 ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UITextField *commentTextField;

@end

@implementation SFNewsCell1

@synthesize sf_viewModel;

+ (BOOL)sf_loadFromNib {
    return NO;
}

- (void)customInit {
    [super customInit];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.commentTextField];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    [self.commentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(34);
    }];


    RACChannelTo(self, comment) = RACChannelTo(self.commentTextField, text);
    [self.commentTextField.rac_textSignal subscribe:RACChannelTo(self, comment)];
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
SFLazyLoad(UITextField, commentTextField, {
    _commentTextField = [[UITextField alloc]init];
    _commentTextField.textColor = [UIColor blackColor];
    _commentTextField.placeholder = @"请输入评论";
})

@end
