//
//  NSString+SFRegex.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "NSString+SFRegex.h"

@implementation NSString (SFRegex)

/// 是否为有效的手机号
- (BOOL)sf_isValidMobileNumber {
    NSString *regex = @"^1(3|4|5|6|7|8|9)\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/// 是否为有效的邮箱号
- (BOOL)sf_isValidEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

/// 是否为有效的金额（保留到小数点后两位）
- (BOOL)sf_isValidMoney {
    //NSString *regex = @"(\\+|\\-)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,8}(([.]\\d{0,2})?)))?";//(带正负号的)
    NSString *regex = @"(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,8}(([.]\\d{0,2})?)))?";//一般格式 d{0,8} 控制位数
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

/// 是否为有效的身份证号
- (BOOL)sf_isValidIdentityCard {
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

@end
