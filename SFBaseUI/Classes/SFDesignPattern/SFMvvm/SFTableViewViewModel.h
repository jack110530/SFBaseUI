//
//  SFTableViewViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFMvvmViewModelProtocol.h"
// manager
#import "SFTableViewManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewViewModel : NSObject<SFMvvmViewModelProtocol>

@property (nonatomic, strong, readonly) SFTableViewManager *tableViewManager;

@end

NS_ASSUME_NONNULL_END
