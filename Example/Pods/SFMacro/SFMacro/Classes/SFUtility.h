//
//  SFUtility.h
//  Pods
//
//  Created by 黄山锋 on 2020/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFUtility : NSObject

/// 获取keyWindow
+ (UIWindow *)getKeyWindow;

/// 获取屏幕缩放比例
+ (CGFloat)getScreenScale;

/// 获取屏幕尺寸
+ (CGSize)getScreenSize;

/// 获取状态栏高度
+ (CGFloat)getStatusBarHeight;

@end

NS_ASSUME_NONNULL_END
