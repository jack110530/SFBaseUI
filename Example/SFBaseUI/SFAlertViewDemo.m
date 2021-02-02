//
//  SFAlertViewDemo.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/2/2.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFAlertViewDemo.h"
#import <SFBaseUI/SFBaseUI.h>

@interface SFAlertViewDemo ()

@end

@implementation SFAlertViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"SFAlertViewDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickBtn {
    [SFAlertView showAlertIn:self title:@"biaoti" message:@"详情详情" cancelTitle:@"cancelsss" actionBlock:^(NSInteger tag) {
        switch (tag) {
            case 0:
            {
                
            }
                break;
                
            default:
                break;
        }
    } otherButtonTitles:@"确定", nil];
}

@end
