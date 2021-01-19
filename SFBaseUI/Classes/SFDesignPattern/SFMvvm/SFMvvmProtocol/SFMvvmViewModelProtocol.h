//
//  SFMvvmViewModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>
#import "SFMvvmModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmViewModelProtocol <NSObject>

#pragma mark - init
+ (instancetype)viewModelWithView:(UIView *)view;
- (instancetype)initWithView:(UIView *)view;

#pragma mark - update
- (void)updateDataWithModel:(__kindof id<SFMvvmModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
