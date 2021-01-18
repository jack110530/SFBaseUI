//
//  SFViewModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFViewModelProtocol <NSObject>

@optional
#pragma mark - init
+ (instancetype)viewModelWithView:(UIView *)view;
- (instancetype)initWithView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
