//
//  SFTableViewManager.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import <Foundation/Foundation.h>
// view
#import "SFTableView.h"
#import "SFTableViewCell.h"
// model
#import "SFTableViewModel.h"
#import "SFTableViewSectionModel.h"
#import "SFTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewManager : NSObject
@property (nonatomic, strong, readonly) SFTableView *tableView;
@property (nonatomic, strong, readonly) SFTableViewModel *tableModel;


#pragma mark - 回调
/// 配置cell
@property (nonatomic, copy) void (^cellForRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof SFTableViewCellModel *cellModel, NSIndexPath *indexPath);

/// 选中cell
@property (nonatomic, copy) void (^didSelectRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof SFTableViewCellModel *cellModel, NSIndexPath *indexPath);

/// 取消选中cell
@property (nonatomic, copy) void (^didDeselectRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof SFTableViewCellModel *cellModel, NSIndexPath *indexPath);


#pragma mark - init
+ (instancetype)managerTableView:(__kindof SFTableView *)tableView;
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView;




#pragma mark - 数据源操作

// MARK: section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)setSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels;

/// 追加section
/// @param sectionModel section数据模型
- (void)appendSectionModel:(SFTableViewSectionModel *)sectionModel;

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)appendSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels;

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)insertSectionModel:(SFTableViewSectionModel *)sectionModel
                      atIndex:(NSInteger)index;

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)insertSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels
                       atIndex:(NSInteger)index;


// MARK: cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)setCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel;

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)appendCellModel:(SFTableViewCellModel *)cellModel inSectionModel:(SFTableViewSectionModel *)sectionModel;

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)appendCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel;

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModel:(SFTableViewCellModel *)cellModel inSectionModel:(SFTableViewSectionModel *)sectionModel atIndex:(NSInteger)index;

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel atIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
