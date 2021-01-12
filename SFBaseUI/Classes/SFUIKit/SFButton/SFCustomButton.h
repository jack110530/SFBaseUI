//
//  SFCustomButton.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SFButtonLayoutStyle) {
    SFButtonLayoutStyleRight = 0,   // 图片在右
    SFButtonLayoutStyleTop,         // 图片在上
    SFButtonLayoutStyleLeft,        // 图片在左
    SFButtonLayoutStyleBottom       // 图片在下
};

@interface SFCustomButton : UIButton

#pragma mark - 自定义布局
/// 图片文字布局样式，默认图片在右
@property (nonatomic,assign) SFButtonLayoutStyle layoutStyle;
/// 图片文字布局距离，默认0
@property (nonatomic,assign) CGFloat layoutSpace;

#pragma mark - 自定义初始化方法
+ (instancetype)customButton;


@end

NS_ASSUME_NONNULL_END
