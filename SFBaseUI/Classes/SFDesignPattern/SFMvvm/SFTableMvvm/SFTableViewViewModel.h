//
//  SFTableViewViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFTableView.h"
#import "SFTableViewCell.h"
#import "SFTableViewModel.h"
#import "SFTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewViewModel : NSObject

#pragma mark - 数据模型
@property (nonatomic, strong) SFTableViewModel *tableModel;

#pragma mark - 回调
@property (nonatomic, copy) void (^cellForRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof SFTableViewCellModel *cellModel, NSIndexPath *indexPath);


#pragma mark - init
+ (instancetype)viewModelWithTableView:(__kindof SFTableView *)tableView;
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView;




@end

NS_ASSUME_NONNULL_END
