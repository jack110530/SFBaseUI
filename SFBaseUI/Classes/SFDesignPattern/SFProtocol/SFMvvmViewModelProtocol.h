//
//  SFMvvmViewModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>

@protocol SFMvvmViewProtocol;
@protocol SFMvvmModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmViewModelProtocol <NSObject>

@optional
/// 绑定
/// @param view 绑定视图
- (void)sf_bindingWithView:(UIView *)view;

/// 绑定
/// @param view 绑定视图
/// @param vc 绑定控制器
- (void)sf_bindingWithView:(UIView *)view viewController:(nullable UIViewController *)vc;

/// 更新
/// @param model 数据模型
- (void)sf_updateWithModel:(__kindof id<SFMvvmModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END



