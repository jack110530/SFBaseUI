//
//  SFCountdownLabel.m
//  SFTool
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCountdownLabel.h"
#import <SFMacro/SFFunc.h>
#import <SFCrashInspector/SFProxy.h>

#define SFDefaultFmt_deadline   @"yyyy/MM/dd HH:mm:ss截止"
#define SFDefaultFmt_day        @"天"
#define SFDefaultFmt_hour       @"时"
#define SFDefaultFmt_minute     @"分"
#define SFDefaultFmt_seconds    @"秒"
#define SFDefaultFmt_exceeded   @"已结束"

#define SFDefaultT1 (3*24*3600)
#define SFDefaultT2 (1*24*3600)
#define SFDefaultT3 (0*24*3600)

#define SFDefaultColor_day      [UIColor redColor]
#define SFDefaultColor_dayUnit  [UIColor redColor]
#define SFDefaultColor_hms      [UIColor whiteColor]
#define SFDefaultColor_hmsUnit  [UIColor blackColor]
#define SFDefaultColor_deadline [UIColor blackColor]
#define SFDefaultColor_exceeded [UIColor grayColor]


@interface SFCountdownLabel ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval t;

@property (nonatomic,copy) NSString *dayStr;
@property (nonatomic,copy) NSString *hourStr;
@property (nonatomic,copy) NSString *minuteStr;
@property (nonatomic,copy) NSString *secondsStr;

// 只在fmt1阶段用到
@property (nonatomic,strong) NSDateFormatter *formatter;

@property (nonatomic,assign) NSRange range_day;
@property (nonatomic,assign) NSRange range_dayUnit;
@property (nonatomic,assign) NSRange range_hour;
@property (nonatomic,assign) NSRange range_hourUnit;
@property (nonatomic,assign) NSRange range_minute;
@property (nonatomic,assign) NSRange range_minuteUnit;
@property (nonatomic,assign) NSRange range_seconds;
@property (nonatomic,assign) NSRange range_secondsUnit;


@end

@implementation SFCountdownLabel

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.t1 = SFDefaultT1;
        self.t2 = SFDefaultT2;
    }
    return self;
}


#pragma mark - func
- (void)counting {
    self.t--;
    if (self.t < 0) {
        [self.timer setFireDate:[NSDate distantFuture]];
        if (self.countdownDidFinishedBlock) {
            self.countdownDidFinishedBlock();
        }
    }
    
    /**
     * 【规则】
     * 假定：
     * 当前剩余时间为t
     * 显示截止时间的最小剩余时间为t1，默认t1 = 3*24*3600（3天）
     * 显示天数+时分秒的最小剩余时间为t2，默认t2 = 1*24*3600（1天）
     * 显示时分秒的最小剩余时间为t3=0
     * t <= t3 时，则显示“已结束”
     *
     * t >= t1 则显示截止时间（即：yyyy/MM/dd HH:mm:ss截止）
     * t < t1 && t  >= t2 则显示天数（即：dd天 dd天 HH:mm:ss）
     * t < t2 && t >= t3  则不显示天数（即：dd天 HH:mm:ss）
     * t < t3 则显示“已结束”
     */
    
    // 天
    NSInteger day = self.t/(60*60*24);
    self.dayStr = SFStringFormat(@" %ld ",day);
    // 小时
    NSInteger hour = (self.t-day*(60*60*24))/3600;
    self.hourStr = SFStringFormat(@" %02ld ",hour);
    // 分钟
    NSInteger minute = (self.t-(day*(60*60*24)+hour*(60*60)))/60;
    self.minuteStr = SFStringFormat(@" %02ld ",minute);
    // 秒
    NSInteger seconds = (self.t-(day*(60*60*24)+hour*(60*60)+minute*60))/1;
    self.secondsStr = SFStringFormat(@" %02ld ",seconds);
    
    if (self.t >= self.t1) {
        // 显示截止时间
        NSDate *deadlineDate = [NSDate dateWithTimeIntervalSince1970:self.deadline];
        NSString *string = [self.formatter stringFromDate:deadlineDate];
        NSMutableAttributedString *mtAttrStr = [[NSMutableAttributedString alloc]initWithString:string];
        [mtAttrStr addAttribute:NSForegroundColorAttributeName
                          value:self.deadlineColor?:SFDefaultColor_deadline
                          range:NSMakeRange(0, string.length)];
        self.attributedText = mtAttrStr.copy;
    }
    else if ((self.t >= self.t2) && (self.t < self.t1)) {
        // 显示天数+时分秒
        NSString *string = SFStringFormat(@"%@%@  %@ %@ %@ %@ %@ %@",
                                          self.dayStr,self.fmt_day?:SFDefaultFmt_day,
                                          self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                          self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute,
                                          self.secondsStr,self.fmt_seconds?:SFDefaultFmt_seconds);
        [self getRangesWithDay:YES];
        NSMutableAttributedString *mtAttrStr = [[NSMutableAttributedString alloc]initWithString:string];
        [mtAttrStr addAttribute:NSForegroundColorAttributeName
                          value:self.dayColor?:SFDefaultColor_day
                          range:self.range_day];
        [mtAttrStr addAttribute:NSFontAttributeName
                          value:[UIFont boldSystemFontOfSize:self.font.pointSize]
                          range:self.range_day];
        [mtAttrStr addAttribute:NSForegroundColorAttributeName
                          value:self.dayUnitColor?:SFDefaultColor_dayUnit
                          range:self.range_dayUnit];
        [self addCustomAttributeForUnit:mtAttrStr];
        [self addCustomAttributeForValue:mtAttrStr];
        self.attributedText = mtAttrStr.copy;
    }
    else if ((self.t >= self.t3) && (self.t < self.t2)) {
        // 显示时分秒
        NSString *string = SFStringFormat(@"%@ %@ %@ %@ %@ %@",
                                          self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                          self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute,
                                          self.secondsStr,self.fmt_seconds?:SFDefaultFmt_seconds);
        [self getRangesWithDay:NO];
        NSMutableAttributedString *mtAttrStr = [[NSMutableAttributedString alloc]initWithString:string];
        [self addCustomAttributeForUnit:mtAttrStr];
        [self addCustomAttributeForValue:mtAttrStr];
        self.attributedText = mtAttrStr.copy;
    }
    else {
        // 显示“已结束”
        NSString *string = self.fmt_exceeded?:SFDefaultFmt_exceeded;
        NSMutableAttributedString *mtAttrStr = [[NSMutableAttributedString alloc]initWithString:string];
        [mtAttrStr addAttribute:NSForegroundColorAttributeName
                          value:self.exceededColor?:SFDefaultColor_exceeded
                          range:NSMakeRange(0, string.length)];
        self.attributedText = mtAttrStr.copy;
    }
}


#pragma mark - func
- (void)getRangesWithDay:(BOOL)withDay {
    if (withDay) {
        self.range_day = NSMakeRange(0, self.dayStr.length);
        self.range_dayUnit = NSMakeRange(self.dayStr.length, (self.fmt_hour?:SFDefaultFmt_hour).length);
        self.range_hour = NSMakeRange(
                                           SFStringFormat(@"%@%@  ",self.dayStr,self.fmt_day?:SFDefaultFmt_day).length,
                                           self.hourStr.length);
        self.range_hourUnit = NSMakeRange(
                                            SFStringFormat(@"%@%@  %@ ",
                                                           self.dayStr,self.fmt_day?:SFDefaultFmt_day,
                                                           self.hourStr).length,
                                            (self.fmt_hour?:SFDefaultFmt_hour).length);
        self.range_minute = NSMakeRange(
                                           SFStringFormat(@"%@%@  %@ %@ ",self.dayStr,self.fmt_day?:SFDefaultFmt_day, self.hourStr,self.fmt_hour?:SFDefaultFmt_hour).length,
                                           self.minuteStr.length);
        self.range_minuteUnit = NSMakeRange(
                                            SFStringFormat(@"%@%@  %@ %@ %@ ",self.dayStr,self.fmt_day?:SFDefaultFmt_day, self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,self.minuteStr).length,
                                            (self.fmt_minute?:SFDefaultFmt_minute).length);
        self.range_seconds = NSMakeRange(
                                           SFStringFormat(@"%@%@  %@ %@ %@ %@ ",self.dayStr,self.fmt_day?:SFDefaultFmt_day,
                                                          self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                                          self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute).length,
                                           self.secondsStr.length);
        self.range_secondsUnit = NSMakeRange(
                                            SFStringFormat(@"%@%@  %@ %@ %@ %@ %@ ",self.dayStr,self.fmt_day?:SFDefaultFmt_day,
                                                           self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                                           self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute,
                                                           self.secondsStr).length,
                                            (self.fmt_seconds?:SFDefaultFmt_minute).length);
    }else{
        self.range_day = NSMakeRange(0, self.dayStr.length);
        self.range_dayUnit = NSMakeRange(self.dayStr.length, (self.fmt_hour?:SFDefaultFmt_hour).length);
        
        self.range_hour = NSMakeRange(
                                           0,
                                           self.hourStr.length);
        self.range_hourUnit = NSMakeRange(
                                            SFStringFormat(@"%@ ",self.hourStr).length,
                                            (self.fmt_hour?:SFDefaultFmt_hour).length);
        self.range_minute = NSMakeRange(
                                           SFStringFormat(@"%@ %@ ",self.hourStr,self.fmt_hour?:SFDefaultFmt_hour).length,
                                           self.minuteStr.length);
        self.range_minuteUnit = NSMakeRange(
                                            SFStringFormat(@"%@ %@ %@ ",self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,self.minuteStr).length,
                                            (self.fmt_minute?:SFDefaultFmt_minute).length);
        self.range_seconds = NSMakeRange(
                                           SFStringFormat(@"%@ %@ %@ %@ ",self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                                          self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute).length,
                                           self.secondsStr.length);
        self.range_secondsUnit = NSMakeRange(
                                            SFStringFormat(@"%@ %@ %@ %@ %@ ",self.hourStr,self.fmt_hour?:SFDefaultFmt_hour,
                                                           self.minuteStr,self.fmt_minute?:SFDefaultFmt_minute,
                                                           self.secondsStr).length,
                                            (self.fmt_seconds?:SFDefaultFmt_minute).length);
    }
}
- (void)addCustomAttributeForUnit:(NSMutableAttributedString *)mtAttrStr {
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_hourUnit];
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_minuteUnit];
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_secondsUnit];
}
- (void)addCustomAttributeForValue:(NSMutableAttributedString *)mtAttrStr {
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsColor?:SFDefaultColor_hms
                      range:self.range_hour];
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsColor?:SFDefaultColor_hms
                      range:self.range_minute];
    [mtAttrStr addAttribute:NSForegroundColorAttributeName
                      value:self.hmsColor?:SFDefaultColor_hms
                      range:self.range_seconds];
    
    [mtAttrStr addAttribute:NSBackgroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_hour];
    [mtAttrStr addAttribute:NSBackgroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_minute];
    [mtAttrStr addAttribute:NSBackgroundColorAttributeName
                      value:self.hmsUnitColor?:SFDefaultColor_hmsUnit
                      range:self.range_seconds];
}


#pragma mark - setter
- (void)setDeadline:(NSTimeInterval)deadline {
    _deadline = deadline;
    NSTimeInterval lastSeconds = deadline - [[NSDate date] timeIntervalSince1970];
    if (lastSeconds > 0) {
        self.t = lastSeconds;
        [self.timer setFireDate:[NSDate distantPast]];
    }
}


#pragma mark - getter
- (NSTimeInterval)t3 {
    return 0;
}
SFLazyLoad(NSTimer, timer, {
    SFProxy *proxy = [SFProxy proxyWithTarget:self];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(counting) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer setFireDate:[NSDate distantFuture]];
})
SFLazyLoad(NSDateFormatter, formatter, {
    _formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:self.fmt_deadline?:SFDefaultFmt_deadline];
    [_formatter setLocale:[NSLocale currentLocale]];
})

#pragma mark - dealloc
- (void)dealloc {
    [_timer invalidate];
    NSLog(@"%s", __func__);
}

@end
