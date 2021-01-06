//
//  SFMaker+UILabel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/28.
//

#import "SFMaker+UILabel.h"

@implementation SFMaker (UILabel)

/// text
- (SFMaker* (^)(NSString *value))text {
    return ^SFMaker* (NSString *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.text = value;
        }
        return self;
    };
}

/// font
- (SFMaker* (^)(UIFont *value))font {
    return ^SFMaker* (UIFont *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.font = value;
        }
        return self;
    };
}

/// textColor
- (SFMaker* (^)(UIColor *value))textColor {
    return ^SFMaker* (UIColor *value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.textColor = value;
        }
        return self;
    };
}

/// textAlignment
- (SFMaker* (^)(NSTextAlignment value))textAlignment {
    return ^SFMaker* (NSTextAlignment value) {
        if ([self.obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.obj;
            label.textAlignment = value;
        }
        return self;
    };
}

/// numberOfLines
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
