//
//  SFButton.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFButton.h"

@implementation SFButton

#pragma mark - 自定义布局
- (void)drawRect:(CGRect)rect {
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据layoutStyle和self.layoutSpace得到imageEdgeInsets和labelEdgeInsets的值
    switch (self.layoutStyle) {
        case SFButtonLayoutStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-self.layoutSpace/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-self.layoutSpace/2.0, 0);
        }
            break;
        case SFButtonLayoutStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -self.layoutSpace/2.0, 0, self.layoutSpace/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, self.layoutSpace/2.0, 0, -self.layoutSpace/2.0);
        }
            break;
        case SFButtonLayoutStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-self.layoutSpace/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-self.layoutSpace/2.0, -imageWith, 0, 0);
        }
            break;
        case SFButtonLayoutStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+self.layoutSpace/2.0, 0, -labelWidth-self.layoutSpace/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-self.layoutSpace/2.0, 0, imageWith+self.layoutSpace/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

#pragma mark - 自定义初始化方法
+ (instancetype)customButton {
    return [self buttonWithType:UIButtonTypeCustom];
}

@end
