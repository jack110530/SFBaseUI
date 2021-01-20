//
//  SFMvvmViewProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>
@protocol SFMvvmViewModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvvmViewProtocol <NSObject>

@optional
/// ViewModel实例对象
/// 遵守单一原则，为了保证view能独立测试，正常情况下，view是不应该持有viewModel的
/// 但是为了方便，在view有复用的情况下，会使用到
@property (nonatomic, strong) id<SFMvvmViewModelProtocol> sf_viewModel;

@end

NS_ASSUME_NONNULL_END
