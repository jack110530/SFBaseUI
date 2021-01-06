//
//  SFUtility.m
//  Pods
//
//  Created by 黄山锋 on 2020/12/23.
//

#import "SFUtility.h"

@implementation SFUtility

/// 获取keyWindow
+ (UIWindow *)getKeyWindow {
    UIWindow* window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.lastObject;
                break;
            }
        }
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }
    return window;
}

/// 获取屏幕缩放比例
+ (CGFloat)getScreenScale {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

/// 获取屏幕尺寸
+ (CGSize)getScreenSize {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

/// 获取状态栏高度
+ (CGFloat)getStatusBarHeight {
    static CGFloat statusBarHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 13.0, *)) {
            UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
            statusBarHeight = statusBarManager.statusBarFrame.size.height;
        }
        else {
            statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    });
    return statusBarHeight;
}

@end
