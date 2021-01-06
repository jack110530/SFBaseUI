//
//  UIViewController+SFNavigator.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SFNavigator)

#pragma mark - 导航栏转场操作
- (void)sf_back;
- (void)sf_push:(UIViewController *)vc;
- (void)sf_present:(UIViewController *)vc;
- (void)sf_configBackIconWithPop:(UIImage *)popIcon dismiss:(UIImage *)dismissIcon;

#pragma mark - 导航栏item配置
- (UIBarButtonItem *)sf_setLeftItemWithTitle:(NSString *)title;
- (UIBarButtonItem *)sf_setRightItemWithTitle:(NSString *)title;
- (UIBarButtonItem *)sf_setLeftItemWithIcon:(NSString *)icon;
- (UIBarButtonItem *)sf_setRightItemWithIcon:(NSString *)icon;
- (NSArray<UIBarButtonItem *> *)sf_setLeftItemWithTitles:(NSArray<NSString *> *)titles;
- (NSArray<UIBarButtonItem *> *)sf_setRightItemWithTitles:(NSArray<NSString *> *)titles;
- (NSArray<UIBarButtonItem *> *)sf_setLeftItemWithIcons:(NSArray<NSString *> *)icons;
- (NSArray<UIBarButtonItem *> *)sf_setRightItemWithIcons:(NSArray<NSString *> *)icons;
/// 点击导航栏左侧item
- (void)sf_clickLeftItemEvent:(UIBarButtonItem *)item;
/// 点击导航栏右侧item
- (void)sf_clickRightItemEvent:(UIBarButtonItem *)item;

@end

NS_ASSUME_NONNULL_END
