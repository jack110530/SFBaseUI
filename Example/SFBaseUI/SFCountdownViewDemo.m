//
//  SFCountdownViewDemo.m
//  SFTool_Example
//
//  Created by 黄山锋 on 2021/1/11.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFCountdownViewDemo.h"
#import <SFBaseUI/SFBaseUI.h>
#import <Masonry/Masonry.h>

@interface SFCountdownViewDemo ()
@property (nonatomic,strong) SFCountdownView *countdownView;
@end

@implementation SFCountdownViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFCountdownViewDemo";
    
    self.countdownView = [[SFCountdownView alloc]initWithFrame:CGRectMake(50, 300, 300, 40)];
    self.countdownView.backgroundColor = [UIColor orangeColor];
    self.countdownView.deadline = [[NSDate date] timeIntervalSince1970] + (3*24*3600) + 3;
    [self.view addSubview:self.countdownView];
}
//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    [self.countdownView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
//        make.left.mas_equalTo(100);
//        make.height.mas_equalTo(80);
//    }];
//}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
