//
//  UIButton+SFMaker.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2020/12/31.
//

#import <UIKit/UIKit.h>
#import "NSObject+SFMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SFMaker)

+ (SFMaker* (^)(UIButtonType type))makeWithType;

@end

NS_ASSUME_NONNULL_END
