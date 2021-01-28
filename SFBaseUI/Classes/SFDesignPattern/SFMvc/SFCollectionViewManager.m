//
//  SFCollectionViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/27.
//

#import "SFCollectionViewManager.h"
#import "SFMvcModelProtocol.h"
// model
#import "SFListModel.h"
#import "SFSectionModel.h"
#import "SFCellModel.h"

@interface SFCollectionViewManager ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSObject<SFListModelProtocol> *listModel;
@end

@implementation SFCollectionViewManager

#pragma mark - init
+ (instancetype)managerWithCollectionView:(__kindof UICollectionView *)collectionView {
    return [[self alloc] initWithCollectionView:collectionView];
}
- (instancetype)initWithCollectionView:(__kindof UICollectionView *)collectionView {
    if (self = [super init]) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        // 初始化数据
        SFSectionModel *sectionModel = [[SFSectionModel alloc]init];
        self.listModel = [[SFListModel alloc]init];
        self.listModel.sf_sectionModels = @[sectionModel];
    }
    return self;
}

#pragma mark - delegate
// MARK: UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.listModel.sf_sectionModels.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return sectionModel.sf_cellModels.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    if ([cellModel conformsToProtocol:@protocol(SFMvcModelProtocol)]) {
        __kindof NSObject<SFCellModelProtocol,SFMvcModelProtocol> *mvcCellModel = (__kindof NSObject<SFCellModelProtocol,SFMvcModelProtocol> *)cellModel;
        __kindof UICollectionViewCell *cell = [collectionView sf_dequeueCell:mvcCellModel.sf_viewCls indexPath:indexPath];
        if (self.cellForRowAtIndexPathBlock) {
            self.cellForRowAtIndexPathBlock(collectionView, cell, cellModel, indexPath);
        }
        if (self.mvvmBindingBlock) {
            self.mvvmBindingBlock(collectionView, cell, cellModel, indexPath);
        }
        if (self.mvvmUpdateBlock) {
            self.mvvmUpdateBlock(collectionView, cell, cellModel, indexPath);
        }
        return cell;
    }
    return nil;
}

// MARK: UICollectionViewDelegate



// MARK: UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//
//}




@end
