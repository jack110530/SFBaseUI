//
//  SFMaker+UILabel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker+UILabel.h"

@implementation SFMaker (UILabel)

/// 【UILabel】text
- (SFMaker* (^)(NSString *value))text {
    return ^SFMaker* (NSString *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.text = value;
        }
        return self;
    };
}

/// 【UILabel】font
- (SFMaker* (^)(UIFont *value))font {
    return ^SFMaker* (UIFont *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.font = value;
        }
        return self;
    };
}

/// 【UILabel】systemFontSize
- (SFMaker* (^)(CGFloat size))systemFontSize {
    return ^SFMaker* (CGFloat size) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.font = [UIFont systemFontOfSize:size];
        }
        return self;
    };
}

/// 【UILabel】systemFontSizeAndWeight
- (SFMaker* (^)(CGFloat size, UIFontWeight weight))systemFontSizeAndWeight {
    return ^SFMaker* (CGFloat size, UIFontWeight weight) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.font = [UIFont systemFontOfSize:size weight:weight];
        }
        return self;
    };
}

/// 【UILabel】boldSystemFontSize
- (SFMaker* (^)(CGFloat size))boldSystemFontSize {
    return ^SFMaker* (CGFloat size) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.font = [UIFont boldSystemFontOfSize:size];
        }
        return self;
    };
}

/// 【UILabel】textColor
- (SFMaker* (^)(UIColor *value))textColor {
    return ^SFMaker* (UIColor *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.textColor = value;
        }
        return self;
    };
}

/// 【UILabel】textAlignment
- (SFMaker* (^)(NSTextAlignment value))textAlignment {
    return ^SFMaker* (NSTextAlignment value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.textAlignment = value;
        }
        return self;
    };
}

/// 【UILabel】numberOfLines
- (SFMaker* (^)(NSInteger value))numberOfLines {
    return ^SFMaker* (NSInteger value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.numberOfLines = value;
        }
        return self;
    };
}




@end
