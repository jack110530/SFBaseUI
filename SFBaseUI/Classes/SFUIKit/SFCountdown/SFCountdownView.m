//
//  SFCountdownView.m
//  SFTool
//
//  Created by 黄山锋 on 2021/1/8.
//

#import "SFCountdownView.h"
#import <SFMacro/SFFunc.h>
#import <SFCrashInspector/SFProxy.h>
#import <YYCategories/UIView+YYAdd.h>
#import <Masonry/Masonry.h>

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

#define SFDefaultFont_day      [UIFont boldSystemFontOfSize:17]
#define SFDefaultFont_dayUnit  [UIFont systemFontOfSize:17]
#define SFDefaultFont_hms      [UIFont systemFontOfSize:17]
#define SFDefaultFont_hmsUnit  [UIFont systemFontOfSize:17]
#define SFDefaultFont_deadline [UIFont systemFontOfSize:17]
#define SFDefaultFont_exceeded [UIFont systemFontOfSize:17]

#define SFDefaultPadding        (0)

typedef NS_ENUM(NSUInteger, SFCountdownState) {
    SFCountdownStateNone = 0,
    SFCountdownStateDeadline,
    SFCountdownStateCountdownWithDay,
    SFCountdownStateCountdownWithoutDay,
    SFCountdownStateExceeded
};

@interface SFCountdownView ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval t;

@property (nonatomic,strong) NSDateFormatter *formatter;
@property (nonatomic,strong) SFCountdownCell *deadlineCell;
@property (nonatomic,strong) SFCountdownCell *dayCell;
@property (nonatomic,strong) SFCountdownCell *dayUnitCell;
@property (nonatomic,strong) SFCountdownCell *hourCell;
@property (nonatomic,strong) SFCountdownCell *hourUnitCell;
@property (nonatomic,strong) SFCountdownCell *minuteCell;
@property (nonatomic,strong) SFCountdownCell *minuteUnitCell;
@property (nonatomic,strong) SFCountdownCell *secondsCell;
@property (nonatomic,strong) SFCountdownCell *secondsUnitCell;
@property (nonatomic,strong) SFCountdownCell *exceededCell;

@property (nonatomic, assign) SFCountdownState state;

@end

@implementation SFCountdownView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.t1 = SFDefaultT1;
        self.t2 = SFDefaultT2;
        self.cellPadding = SFDefaultPadding;
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
    NSString *dayStr = SFStringFormat(@"%ld",day);
    // 小时
    NSInteger hour = (self.t-day*(60*60*24))/3600;
    NSString *hourStr = SFStringFormat(@"%02ld",hour);
    // 分钟
    NSInteger minute = (self.t-(day*(60*60*24)+hour*(60*60)))/60;
    NSString *minuteStr = SFStringFormat(@"%02ld",minute);
    // 秒
    NSInteger seconds = (self.t-(day*(60*60*24)+hour*(60*60)+minute*60))/1;
    NSString *secondsStr = SFStringFormat(@"%02ld",seconds);
    
    if (self.t >= self.t1) {
        // 显示截止时间
        self.state = SFCountdownStateDeadline;
        NSDate *deadlineDate = [NSDate dateWithTimeIntervalSince1970:self.deadline];
        [self.formatter setDateFormat:self.fmt_deadline?:SFDefaultFmt_deadline];
        NSString *string = [self.formatter stringFromDate:deadlineDate];
        self.deadlineCell.valueLabel.text = string;
    }
    else if ((self.t >= self.t2) && (self.t < self.t1)) {
        // 显示天数+时分秒
        self.state = SFCountdownStateCountdownWithDay;
        self.dayCell.valueLabel.text = dayStr;
        self.dayUnitCell.valueLabel.text = self.fmt_day?:SFDefaultFmt_day;
        self.hourCell.valueLabel.text = hourStr;
        self.hourUnitCell.valueLabel.text = self.fmt_hour?:SFDefaultFmt_hour;
        self.minuteCell.valueLabel.text = minuteStr;
        self.minuteUnitCell.valueLabel.text = self.fmt_minute?:SFDefaultFmt_minute;
        self.secondsCell.valueLabel.text = secondsStr;
        self.secondsUnitCell.valueLabel.text = self.fmt_seconds?:SFDefaultFmt_seconds;
    }
    else if ((self.t >= self.t3) && (self.t < self.t2)) {
        // 显示时分秒
        self.state = SFCountdownStateCountdownWithoutDay;
        self.hourCell.valueLabel.text = hourStr;
        self.hourUnitCell.valueLabel.text = self.fmt_hour?:SFDefaultFmt_hour;
        self.minuteCell.valueLabel.text = minuteStr;
        self.minuteUnitCell.valueLabel.text = self.fmt_minute?:SFDefaultFmt_minute;
        self.secondsCell.valueLabel.text = secondsStr;
        self.secondsUnitCell.valueLabel.text = self.fmt_seconds?:SFDefaultFmt_seconds;
    }
    else {
        // 显示“已结束”
        self.state = SFCountdownStateExceeded;
        self.exceededCell.valueLabel.text = self.fmt_exceeded?:SFDefaultFmt_exceeded;
    }
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
- (void)setState:(SFCountdownState)state {
    if (_state != state) {
        [self removeAllSubviews];
    }
    switch (state) {
        case SFCountdownStateDeadline:
        {
            self.deadlineCell.valueLabel.textColor = self.deadlineColor?:SFDefaultColor_deadline;
            self.deadlineCell.valueLabel.font = self.deadlineFont?:(self.font?:SFDefaultFont_deadline);
            self.deadlineCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.deadlineCell];
        }
            break;
        case SFCountdownStateCountdownWithDay:
        {
            self.dayCell.valueLabel.textColor = self.dayColor?:SFDefaultColor_day;
            self.dayCell.valueLabel.font = self.dayFont?:(self.font?:SFDefaultFont_day);
            self.dayCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.dayCell];
            self.dayUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_dayUnit;
            self.dayUnitCell.valueLabel.font = self.dayUnitFont?:(self.font?:SFDefaultFont_dayUnit);
            self.dayUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.dayUnitCell];
            self.hourCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.hourCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.hourCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.hourCell];
            self.hourUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.hourUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.hourUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.hourUnitCell];
            self.minuteCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.minuteCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.minuteCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.minuteCell];
            self.minuteUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.minuteUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.minuteUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.minuteUnitCell];
            self.secondsCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.secondsCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.secondsCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.secondsCell];
            self.secondsUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.secondsUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.secondsUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.secondsUnitCell];
        }
            break;
        case SFCountdownStateCountdownWithoutDay:
        {
            self.hourCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.hourCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.hourCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.hourCell];
            self.hourUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.hourUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.hourUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.hourUnitCell];
            self.minuteCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.minuteCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.minuteCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.minuteCell];
            self.minuteUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.minuteUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.minuteUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.minuteUnitCell];
            self.secondsCell.valueLabel.textColor = self.hmsColor?:SFDefaultColor_hms;
            self.secondsCell.valueLabel.font = self.hmsFont?:(self.font?:SFDefaultFont_hms);
            self.secondsCell.backgroundColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            [self addSubview:self.secondsCell];
            self.secondsUnitCell.valueLabel.textColor = self.hmsUnitColor?:SFDefaultColor_hmsUnit;
            self.secondsUnitCell.valueLabel.font = self.hmsUnitFont?:(self.font?:SFDefaultFont_hmsUnit);
            self.secondsUnitCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.secondsUnitCell];
        }
            break;
        case SFCountdownStateExceeded:
        {
            self.exceededCell.valueLabel.textColor = self.exceededColor?:SFDefaultColor_exceeded;
            self.exceededCell.valueLabel.font = self.exceededFont?:(self.font?:SFDefaultFont_exceeded);
            self.exceededCell.backgroundColor = [UIColor clearColor];
            [self addSubview:self.exceededCell];
        }
            break;
            
        default:
            break;
    }
    if (_state != state) {
        [self customLayout:state];
    }
    _state = state;
}
- (void)customLayout:(SFCountdownState)state {
    switch (state) {
        case SFCountdownStateDeadline:
        {
            [self.deadlineCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.mas_equalTo(self.cellPadding);
                make.right.mas_lessThanOrEqualTo(-self.cellPadding);
            }];
        }
            break;
        case SFCountdownStateCountdownWithDay:
        {
            [self.dayCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.mas_equalTo(self.cellPadding);
            }];
            [self.dayUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.dayCell.mas_right).offset(self.cellPadding);
            }];
            [self.hourCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.dayUnitCell.mas_right).offset(self.cellPadding);
            }];
            [self.hourUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.hourCell.mas_right).offset(self.cellPadding);
            }];
            [self.minuteCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.hourUnitCell.mas_right).offset(self.cellPadding);
            }];
            [self.minuteUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.minuteCell.mas_right).offset(self.cellPadding);
            }];
            [self.secondsCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.minuteUnitCell.mas_right).offset(self.cellPadding);
            }];
            [self.secondsUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.secondsCell.mas_right).offset(self.cellPadding);
                make.right.mas_lessThanOrEqualTo(-self.cellPadding);
            }];
        }
            break;
        case SFCountdownStateCountdownWithoutDay:
        {
            [self.hourCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.mas_equalTo(self.cellPadding);
            }];
            [self.hourUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.hourCell.mas_right).offset(self.cellPadding);
            }];
            [self.minuteCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.hourUnitCell.mas_right).offset(self.cellPadding);
            }];
            [self.minuteUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.minuteCell.mas_right).offset(self.cellPadding);
            }];
            [self.secondsCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.minuteUnitCell.mas_right).offset(self.cellPadding);
            }];
            [self.secondsUnitCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.equalTo(self.secondsCell.mas_right).offset(self.cellPadding);
                make.right.mas_lessThanOrEqualTo(-self.cellPadding);
            }];
        }
            break;
        case SFCountdownStateExceeded:
        {
            [self.exceededCell mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.left.mas_equalTo(self.cellPadding);
                make.right.mas_lessThanOrEqualTo(-self.cellPadding);
            }];
        }
            break;
            
        default:
            break;
    }
}
- (void)setCellCorner:(CGFloat)cellCorner {
    _cellCorner = cellCorner;
    NSArray *cells = @[self.deadlineCell, self.dayCell, self.dayUnitCell, self.hourCell, self.hourUnitCell, self.minuteCell, self.minuteUnitCell, self.secondsCell, self.secondsUnitCell, self.exceededCell];
    for (SFCountdownCell *cell in cells) {
        cell.layer.cornerRadius = cellCorner;
        cell.layer.masksToBounds = YES;
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
    [_formatter setLocale:[NSLocale currentLocale]];
})
SFLazyLoad(SFCountdownCell, deadlineCell, {
    _deadlineCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, dayCell, {
    _dayCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, dayUnitCell, {
    _dayUnitCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, hourCell, {
    _hourCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, hourUnitCell, {
    _hourUnitCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, minuteCell, {
    _minuteCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, minuteUnitCell, {
    _minuteUnitCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, secondsCell, {
    _secondsCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, secondsUnitCell, {
    _secondsUnitCell = [[SFCountdownCell alloc]init];
})
SFLazyLoad(SFCountdownCell, exceededCell, {
    _exceededCell = [[SFCountdownCell alloc]init];
})



#pragma mark - dealloc
- (void)dealloc {
    [_timer invalidate];
    NSLog(@"%s", __func__);
}

@end



#pragma mark - SFCountdownCell
#import <Masonry/Masonry.h>
@interface SFCountdownCell ()

@end

@implementation SFCountdownCell

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.valueLabel];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(2, 2, 2, 2));
    }];
}

#pragma mark - getter
SFLazyLoad(UILabel, valueLabel, {
    _valueLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
})

@end
