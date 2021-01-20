//
//  SFMvvmModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import "SFMvcModelProtocol.h"
#import "SFMvvmViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmModelProtocol <SFMvcModelProtocol>

@optional
/// ViewModel类对象
@property (nonatomic, strong) Class<SFMvvmViewModelProtocol> sf_viewModelCls;

@end

NS_ASSUME_NONNULL_END
