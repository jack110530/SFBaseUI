//
//  SFCircleProgressViewDemo.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/12.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFCircleProgressViewDemo.h"
#import <SFBaseUI/SFBaseUI.h>
#import <Masonry/Masonry.h>

@interface SFCircleProgressViewDemo ()
@property (nonatomic,strong) SFCircleProgressView *progressView;
@property (nonatomic,strong) SFCircleProgressView *progressView1;

@end

@implementation SFCircleProgressViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressView = [[SFCircleProgressView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.progressView];
    self.progressView.progress = 0.3;
    
    self.progressView1 = [[SFCircleProgressView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.progressView1];
    self.progressView1.progress = 0.3;
    self.progressView1.startAngle = M_PI;
    self.progressView1.endAngle = M_PI*2;
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.progressView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressView.mas_bottom).offset(50);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}
- (IBAction)change:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.progressView setProgress:0.8 animated:YES];
        [self.progressView1 setProgress:0.8 animated:YES];
    }else{
        [self.progressView setProgress:0.3 animated:YES];
        [self.progressView1 setProgress:0.3 animated:YES];
    }
}

@end
