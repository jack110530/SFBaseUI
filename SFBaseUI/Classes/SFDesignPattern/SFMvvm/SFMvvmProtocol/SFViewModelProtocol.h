//
//  SFViewModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/18.
//

#import <Foundation/Foundation.h>
#import "SFModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFViewModelProtocol <NSObject>

@optional

#pragma mark - init
+ (instancetype)viewModelWithView:(UIView *)view;
- (instancetype)initWithView:(UIView *)view;

#pragma mark - update
- (void)updateDataWithModel:(__kindof id<SFModelProtocol>)model;


@end

NS_ASSUME_NONNULL_END
