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
// modelProtocol
#import "SFTableViewModelProtocol.h"
#import "SFTableViewSectionModelProtocol.h"
#import "SFTableViewCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewManager : NSObject
@property (nonatomic, strong, readonly) SFTableView *tableView;
@property (nonatomic, strong, readonly) NSObject<SFTableViewModelProtocol> *tableModel;


#pragma mark - 回调
/// 配置cell
@property (nonatomic, copy) void (^cellForRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof NSObject<SFTableViewCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 选中cell
@property (nonatomic, copy) void (^didSelectRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof NSObject<SFTableViewCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 取消选中cell
@property (nonatomic, copy) void (^didDeselectRowAtIndexPathBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof NSObject<SFTableViewCellModelProtocol> *cellModel, NSIndexPath *indexPath);

// MARK: MVVM相关回调
/// mvvmBinding
@property (nonatomic, copy) void (^mvvmBindingBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof NSObject<SFTableViewCellModelProtocol> *cellModel, NSIndexPath *indexPath);
/// mvvmUpdate
@property (nonatomic, copy) void (^mvvmUpdateBlock)(__kindof SFTableView *tableView, __kindof SFTableViewCell *cell, __kindof NSObject<SFTableViewCellModelProtocol> *cellModel, NSIndexPath *indexPath);


#pragma mark - init
+ (instancetype)managerTableView:(__kindof SFTableView *)tableView;
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView;

#pragma mark - 数据源操作
// MARK: section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)setSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels;

/// 追加section
/// @param sectionModel section数据模型
- (void)appendSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel;

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)appendSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels;

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)insertSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel
                   atIndex:(NSInteger)index;

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)insertSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels
                    atIndex:(NSInteger)index;


// MARK: cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)setCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel;

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)appendCellModel:(NSObject<SFTableViewCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel;

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)appendCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel;

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModel:(NSObject<SFTableViewCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index;

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
