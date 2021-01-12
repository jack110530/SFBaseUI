//
//  SFCountdownLabelDemo.m
//  SFTool_Example
//
//  Created by 黄山锋 on 2021/1/11.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFCountdownLabelDemo.h"
#import <SFBaseUI/SFBaseUI.h>

@interface SFCountdownLabelDemo ()

@property (nonatomic,strong) SFCountdownLabel *countdownLabel;
@end

@implementation SFCountdownLabelDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFCountdownLabelDemo";
    
    self.countdownLabel = [[SFCountdownLabel alloc]initWithFrame:CGRectMake(50, 300, 300, 40)];
    self.countdownLabel.deadline = [[NSDate date] timeIntervalSince1970] + (3*24*3600) + 3;
    self.countdownLabel.countdownDidFinishedBlock = ^{
        NSLog(@"倒计时完成");
    };
    
//    // 自定义配置(可选)
//    self.countdownLabel.backgroundColor = [UIColor cyanColor];
//    self.countdownLabel.font = [UIFont systemFontOfSize:15];
//    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
//    self.countdownLabel.fmt_deadline = @"活动截止到yyyy-MM-dd HH:mm:ss";
//    self.countdownLabel.fmt_day = @"天";
//    self.countdownLabel.fmt_hour = @":";
//    self.countdownLabel.fmt_minute = @":";
//    self.countdownLabel.fmt_seconds = @"";
//    self.countdownLabel.fmt_exceeded = @"秒杀活动已结束";
//    self.countdownLabel.dayColor = [UIColor redColor];
//    self.countdownLabel.dayUnitColor = [UIColor redColor];
//    self.countdownLabel.hmsUnitColor = [UIColor blackColor];
//    self.countdownLabel.hmsColor = [UIColor whiteColor];
//    self.countdownLabel.deadlineColor = [UIColor blueColor];
//    self.countdownLabel.exceededColor = [UIColor redColor];
    
    [self.view addSubview:self.countdownLabel];
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
