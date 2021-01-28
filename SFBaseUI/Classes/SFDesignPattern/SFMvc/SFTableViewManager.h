//
//  SFTableViewManager.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import <Foundation/Foundation.h>
#import <SFCategory/SFCategory.h>
// modelProtocol
#import "SFListModelProtocol.h"
#import "SFSectionModelProtocol.h"
#import "SFCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewManager : NSObject
@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong, readonly) NSObject<SFListModelProtocol> *tableModel;


#pragma mark - 回调
/// 配置cell
@property (nonatomic, copy) void (^cellForRowAtIndexPathBlock)(__kindof UITableView *tableView, __kindof UITableViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 选中cell
@property (nonatomic, copy) void (^didSelectRowAtIndexPathBlock)(__kindof UITableView *tableView, __kindof UITableViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 取消选中cell
@property (nonatomic, copy) void (^didDeselectRowAtIndexPathBlock)(__kindof UITableView *tableView, __kindof UITableViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

// MARK: MVVM相关回调
/// mvvmBinding
@property (nonatomic, copy) void (^mvvmBindingBlock)(__kindof UITableView *tableView, __kindof UITableViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);
/// mvvmUpdate
@property (nonatomic, copy) void (^mvvmUpdateBlock)(__kindof UITableView *tableView, __kindof UITableViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);


#pragma mark - init
+ (instancetype)managerTableView:(__kindof UITableView *)tableView;
- (instancetype)initWithTableView:(__kindof UITableView *)tableView;

#pragma mark - 数据源操作
// MARK: section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)setSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels;

/// 追加section
/// @param sectionModel section数据模型
- (void)appendSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel;

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)appendSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels;

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)insertSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel
                   atIndex:(NSInteger)index;

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)insertSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels
                    atIndex:(NSInteger)index;


// MARK: cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)setCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel;

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)appendCellModel:(NSObject<SFCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel;

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)appendCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel;

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModel:(NSObject<SFCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index;

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
