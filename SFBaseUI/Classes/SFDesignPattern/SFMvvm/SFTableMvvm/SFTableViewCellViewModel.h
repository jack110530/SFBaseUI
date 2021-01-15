//
//  SFTableViewCellViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFTableViewCell.h"
#import "SFTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewCellViewModel : NSObject

#pragma mark - 数据模型
@property (nonatomic, strong) SFTableViewCellModel *cellModel;

#pragma mark - 回调
// MARK: 数据绑定
@property (nonatomic, copy) void (^dataBindingBlock)(__kindof SFTableViewCell *cell, __kindof SFTableViewCellModel *cellModel);


#pragma mark - init
+ (instancetype)viewModelWithTableViewCell:(SFTableViewCell *)cell;
- (instancetype)viewModelWithTableViewCell:(SFTableViewCell *)cell;


@end

NS_ASSUME_NONNULL_END
