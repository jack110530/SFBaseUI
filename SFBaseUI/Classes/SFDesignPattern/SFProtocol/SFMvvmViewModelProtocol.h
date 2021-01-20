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
- (void)bindingWithView:(UIView<SFMvvmViewProtocol> *)view;
- (void)updateWithModel:(__kindof id<SFMvvmModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END



