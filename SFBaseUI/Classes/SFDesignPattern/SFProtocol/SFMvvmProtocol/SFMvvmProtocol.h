//
//  SFMvvmProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/18.
//

#import <Foundation/Foundation.h>
#import "SFViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmProtocol <NSObject>

@optional
@property (nonatomic, strong) SFViewModel *sf_viewModel;

@end

NS_ASSUME_NONNULL_END
