//
//  SFCountdownButton.m
//  SFCountdownButton_Example
//
//  Created by 黄山锋 on 2020/12/22.
//  Copyright © 2020 jack110530. All rights reserved.
//

#import "SFCountdownButton.h"

@interface SFCountdownButton ()
@property (nonatomic, assign) SFCountdownStatus status;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval curDuring; // 倒计时
@property (nonatomic, strong) UIActivityIndicatorView *indicator; // 菊花怪
// 是否为第一次，默认YES
@property (nonatomic, assign) BOOL isFirst;

@property (nonatomic, assign) SFCountdownStatus readyStatus;

@end

@implementation SFCountdownButton

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultSetting];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self defaultSetting];
    }
    return self;
}
/// 默认设置
- (void)defaultSetting {
    self.during = 60;
    self.loadingColor = [UIColor whiteColor];
    self.isFirst = YES;
    [self unready];
}
- (void)layoutSubviews {
    self.indicator.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [super layoutSubviews];
}

#pragma mark - func
// 预备倒计时
- (void)ready {
    if (self.status == SFCountdownStatusLoading || self.status == SFCountdownStatusCounting) {
        self.readyStatus = SFCountdownStatusReady;
        return;
    }
    self.status = SFCountdownStatusReady;
    [self changeUI];
}

// 取消预备倒计时
- (void)unready {
    if (self.status == SFCountdownStatusLoading || self.status == SFCountdownStatusCounting) {
        self.readyStatus = SFCountdownStatusUnready;
        return;
    }
    self.status = SFCountdownStatusUnready;
    [self changeUI];
}

/// 开始网络请求
- (void)loading {
    if (self.status == SFCountdownStatusReady || self.status == SFCountdownStatusFinished) {
        self.status = SFCountdownStatusLoading;
        [self changeUI];
    }
}

/// 开始倒计时
- (void)start {
    if (self.status == SFCountdownStatusReady || self.status == SFCountdownStatusLoading || self.status == SFCountdownStatusFinished) {
        self.curDuring = self.during;
        [self changeUI];
        [self.timer setFireDate:[NSDate distantPast]];
        if (self.countdownDidStartBlock) {
            self.countdownDidStartBlock();
        }
    }
}

/// 正在倒计时
- (void)counting {
    self.curDuring--;
    self.status = SFCountdownStatusCounting;
    [self changeUI];
    if (self.countdownIsCountingBlock) {
        self.countdownIsCountingBlock(self.curDuring);
    }
}

/// 结束倒计时
- (void)finish {
    if (self.readyStatus) {
        self.status = self.readyStatus;
        self.readyStatus = SFCountdownStatusNone;
    }else{
        self.status = SFCountdownStatusFinished;
    }
    self.isFirst = NO;
    [self changeUI];
    [self.timer setFireDate:[NSDate distantFuture]];
    if (self.countdownDidFinishedBlock) {
        self.countdownDidFinishedBlock();
    }
}


#pragma mark - UI
- (void)setCustomEnable:(BOOL)enable {
    if (enable) {
        if (self.enableUI) {
            self.enableUI(self);
        }else{
            self.backgroundColor = [UIColor orangeColor];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }else{
        if (self.disableUI) {
            self.disableUI(self);
        }else{
            self.backgroundColor = [UIColor grayColor];
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}
- (void)changeUI {
    if (self.indicator.isAnimating) {
        [self.indicator stopAnimating];
        [self.indicator removeFromSuperview];
    }
    switch (self.status) {
        case SFCountdownStatusUnready:
        {
            NSString *title0 = self.firstTryTitle ?: @"获取验证码";
            NSString *title1 = self.retryTitle ?: @"重新获取";
            NSString *title = self.isFirst ? title0 : title1;
            [self setTitle:title forState:UIControlStateNormal];
            [self setCustomEnable:NO];
            self.userInteractionEnabled = YES;
        }
            break;
            
        case SFCountdownStatusReady:
        {
            NSString *title0 = self.firstTryTitle ?: @"获取验证码";
            NSString *title1 = self.retryTitle ?: @"重新获取";
            NSString *title = self.isFirst ? title0 : title1;
            [self setTitle:title forState:UIControlStateNormal];
            [self setCustomEnable:YES];
            self.userInteractionEnabled = YES;
        }
            break;
            
        case SFCountdownStatusLoading:
        {
            [self setTitle:@"" forState:UIControlStateNormal];
            [self setCustomEnable:YES];
            [self addSubview:self.indicator];
            [self.indicator startAnimating];
            self.userInteractionEnabled = NO;
        }
            break;
            
        case SFCountdownStatusCounting:
        {
            if (self.curDuring<0) {
                [self finish];
                return;
            }
            NSString *format = self.countingFormat ?: @"获取(%.0f秒)";
            NSString *title = [NSString stringWithFormat:format, self.curDuring];
            [self setTitle:title forState:UIControlStateNormal];
            [self setCustomEnable:NO];
            self.userInteractionEnabled = NO;
        }
            break;
            
        case SFCountdownStatusFinished:
        {
            NSString *title = self.retryTitle ?: @"重新获取";
            [self setTitle:title forState:UIControlStateNormal];
            [self setCustomEnable:YES];
            self.userInteractionEnabled = YES;
        }
            break;
            
        default:
            break;
    }
    
}




#pragma mark - setter
- (void)setEnableUI:(void (^)(SFCountdownButton * _Nonnull))enableUI {
    _enableUI = enableUI;
    [self changeUI];
}
- (void)setDisableUI:(void (^)(SFCountdownButton * _Nonnull))disableUI {
    _disableUI = disableUI;
    [self changeUI];
}
- (void)setLoadingColor:(UIColor *)loadingColor {
    _loadingColor = loadingColor;
    self.indicator.color = loadingColor;
}


#pragma mark - getter
- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        UIActivityIndicatorViewStyle style;
        if (@available(iOS 13.0, *)) {
            style = UIActivityIndicatorViewStyleMedium;
        } else {
            style = UIActivityIndicatorViewStyleWhite;
        }
        _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:style];
        _indicator.color = [UIColor whiteColor];
    }
    return _indicator;
}
- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(counting) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer setFireDate:[NSDate distantFuture]];
    }
    return _timer;
}




- (void)dealloc {
    [_timer invalidate];
    NSLog(@"%s", __func__);
}

@end

