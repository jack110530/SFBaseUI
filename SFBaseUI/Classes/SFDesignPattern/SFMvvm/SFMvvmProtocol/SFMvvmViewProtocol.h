//
//  SFMvvmViewProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>
#import "SFMvvmViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmViewProtocol <NSObject>

@optional
@property (nonatomic, strong) id<SFMvvmViewModelProtocol> sf_viewModel;

@end

NS_ASSUME_NONNULL_END
