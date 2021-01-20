//
//  SFNewsCell2.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsCell2.h"

@interface SFNewsCell2 ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation SFNewsCell2

@synthesize sf_viewModel;

+ (BOOL)sf_loadFromNib {
    return YES;
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
- (void)setImg:(NSString *)img {
    _img = img;
    if (img) {
        self.imgView.image = [UIImage imageNamed:img];
    }
}

@end
