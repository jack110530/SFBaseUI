//
//  SFViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/18.
//

#import <Foundation/Foundation.h>
#import "SFViewModelProtocol.h"
#import "SFTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFViewModel : NSObject<SFViewModelProtocol>

@property (nonatomic, copy) void (^updateDataBlock)(__kindof SFTableViewCellModel *model);

@end

NS_ASSUME_NONNULL_END
