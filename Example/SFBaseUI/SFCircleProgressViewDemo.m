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
{}
@property (nonatomic,strong) SFCircleProgressView *progressView;
@end

@implementation SFCircleProgressViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressView = [[SFCircleProgressView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.progressView];
    self.progressView.progress = 0.5;
    
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}
- (IBAction)change:(id)sender {
    [self.progressView setProgress:0.8 animated:YES];
}

@end
