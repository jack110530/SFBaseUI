//
//  SFCollectionViewManager.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import <SFCategory/SFCategory.h>
// modelProtocol
#import "SFListModelProtocol.h"
#import "SFSectionModelProtocol.h"
#import "SFCellModelProtocol.h"

// TODO: 待完善

NS_ASSUME_NONNULL_BEGIN

@interface SFCollectionViewManager : NSObject

@property (nonatomic, strong, readonly) UICollectionView *collectionView;
@property (nonatomic, strong, readonly) NSObject<SFListModelProtocol> *listModel;

#pragma mark - 回调
/// 配置cell
@property (nonatomic, copy) void (^cellForRowAtIndexPathBlock)(__kindof UICollectionView *tableView, __kindof UICollectionViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 选中cell
@property (nonatomic, copy) void (^didSelectRowAtIndexPathBlock)(__kindof UICollectionView *tableView, __kindof UICollectionViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

/// 取消选中cell
@property (nonatomic, copy) void (^didDeselectRowAtIndexPathBlock)(__kindof UICollectionView *tableView, __kindof UICollectionViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);

// MARK: MVVM相关回调
/// mvvmBinding
@property (nonatomic, copy) void (^mvvmBindingBlock)(__kindof UICollectionView *tableView, __kindof UICollectionViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);
/// mvvmUpdate
@property (nonatomic, copy) void (^mvvmUpdateBlock)(__kindof UICollectionView *tableView, __kindof UICollectionViewCell *cell, __kindof NSObject<SFCellModelProtocol> *cellModel, NSIndexPath *indexPath);


@end

NS_ASSUME_NONNULL_END
