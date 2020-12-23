//
//  SFCountdownButton.h
//  SFCountdownButton_Example
//
//  Created by 黄山锋 on 2020/12/22.
//  Copyright © 2020 jack110530. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SFCountdownStatus) {
    SFCountdownStatusNone = 0,
    SFCountdownStatusUnready,       // 未准备状态，默认
    SFCountdownStatusReady,         // 准备状态
    SFCountdownStatusLoading,       // 网络请求中
    SFCountdownStatusCounting,      // 正在倒计时
    SFCountdownStatusFinished,      // 倒计时结束
};


@interface SFCountdownButton : UIButton

/// 当前状态
@property (nonatomic, assign, readonly) SFCountdownStatus status;

/// 倒计时时间，默认60s
@property (nonatomic, assign) NSTimeInterval during;
/// loading颜色，默认whiteColor
@property (nonatomic, strong) UIColor *loadingColor;
/// 第一次获取的标题，默认：获取验证码
@property (nonatomic, copy) NSString *firstTryTitle;
/// 倒计时时的标题格式，默认：获取(%.0f秒)
@property (nonatomic, copy) NSString *countingFormat;
/// 重新获取时的标题，默认：重新获取
@property (nonatomic, copy) NSString *retryTitle;


/// 开始倒计时回调
@property (nonatomic, copy) void (^countdownDidStartBlock)(void);
/// 正在倒计时回调
@property (nonatomic, copy) void (^countdownIsCountingBlock)(NSTimeInterval ti);
/// 倒计时完成回调
@property (nonatomic, copy) void (^countdownDidFinishedBlock)(void);


#pragma mark - ui
@property (nonatomic, copy) void (^enableUI)(SFCountdownButton *btn);
@property (nonatomic, copy) void (^disableUI)(SFCountdownButton *btn);


#pragma mark - func
/// 预备倒计时
- (void)ready;
/// 取消预备倒计时
- (void)unready;

/// 开始网络请求
- (void)loading;
/// 开始倒计时
- (void)start;
/// 结束倒计时
- (void)finish;



@end

NS_ASSUME_NONNULL_END
