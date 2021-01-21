//
//  SFTableViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import "SFTableViewManager.h"
#import "SFMvcModelProtocol.h"

// model
#import "SFTableViewModel.h"
#import "SFTableViewSectionModel.h"
#import "SFTableViewCellModel.h"


@interface SFTableViewManager ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) NSObject<SFTableViewModelProtocol> *tableModel;
@end

@implementation SFTableViewManager

#pragma mark - init
+ (instancetype)managerTableView:(__kindof SFTableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        // 初始化数据
        SFTableViewSectionModel *sectionModel = [[SFTableViewSectionModel alloc]init];
        self.tableModel = [[SFTableViewModel alloc]init];
        self.tableModel.sf_sectionModels = @[sectionModel];
    }
    return self;
}



#pragma mark - 数据源操作
// MARK: section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)setSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels {
    self.tableModel.sf_sectionModels = sectionModels;
}

/// 追加section
/// @param sectionModel section数据模型
- (void)appendSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel {
    [self appendSectionModels:@[sectionModel]];
}

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)appendSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels {
    [self insertSectionModels:sectionModels atIndex:self.tableModel.sf_sectionModels.count-1];
}

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)insertSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel
                   atIndex:(NSInteger)index {
    [self insertSectionModels:@[sectionModel] atIndex:index];
}

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)insertSectionModels:(NSArray<NSObject<SFTableViewSectionModelProtocol> *> *)sectionModels
                    atIndex:(NSInteger)index {
    NSArray *oldSectionModels = self.tableModel.sf_sectionModels;
    NSMutableArray *newSectionModels = [NSMutableArray arrayWithArray:oldSectionModels];
    NSUInteger i = index;
    for (id obj in sectionModels) {
        [newSectionModels insertObject:obj atIndex:i++];
    }
    self.tableModel.sf_sectionModels = newSectionModels.copy;
}


// MARK: cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)setCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel {
    if (!sectionModel) {
        return;
    }
    sectionModel.sf_cellModels = cellModels;
}

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)appendCellModel:(NSObject<SFTableViewCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel {
    [self appendCellModels:@[cellModel] inSectionModel:sectionModel];
}

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)appendCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel {
    [self insertCellModels:cellModels inSectionModel:sectionModel atIndex:sectionModel.sf_cellModels.count-1];
}

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModel:(NSObject<SFTableViewCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index {
    [self insertCellModels:@[cellModel] inSectionModel:sectionModel atIndex:index];
}

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModels:(NSArray<NSObject<SFTableViewCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFTableViewSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index {
    if (!sectionModel) {
        return;
    }
    NSArray *oldCellModels = sectionModel.sf_cellModels;
    NSMutableArray *newCellModels = [NSMutableArray arrayWithArray:oldCellModels];
    NSUInteger i = index;
    for (id obj in cellModels) {
        [newCellModels insertObject:obj atIndex:i++];
    }
    sectionModel.sf_cellModels = newCellModels.copy;
}



#pragma mark - delegate
// MARK: UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableModel.sf_sectionModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return sectionModel.sf_cellModels.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFTableViewCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    if ([cellModel conformsToProtocol:@protocol(SFMvcModelProtocol)]) {
        __kindof NSObject<SFTableViewCellModelProtocol,SFMvcModelProtocol> *mvcCellModel = (__kindof NSObject<SFTableViewCellModelProtocol,SFMvcModelProtocol> *)cellModel;
        __kindof SFTableViewCell *cell = [self.tableView sf_dequeueCell:mvcCellModel.sf_viewCls indexPath:indexPath];
        if (self.cellForRowAtIndexPathBlock) {
            self.cellForRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
        }
        if (self.mvvmBindingBlock) {
            self.mvvmBindingBlock(self.tableView, cell, cellModel, indexPath);
        }
        if (self.mvvmUpdateBlock) {
            self.mvvmUpdateBlock(self.tableView, cell, cellModel, indexPath);
        }
        return cell;
    }
    return nil;
}

// MARK: UITableViewDelegate
// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFTableViewCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    return [cellModel.sf_height floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return [sectionModel.sf_headerHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return [sectionModel.sf_footerHeight floatValue];
}

// estimatedHeight
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFTableViewCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    return [cellModel.sf_estimatedHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return [sectionModel.sf_estimatedHeaderHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return [sectionModel.sf_estimatedFooterHeight floatValue];
}

// section header & footer
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return sectionModel.sf_header;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[section];
    return sectionModel.sf_footer;
}

// cell select & deselect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFTableViewCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectRowAtIndexPathBlock) {
        self.didSelectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFTableViewSectionModelProtocol> *sectionModel = self.tableModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFTableViewCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didDeselectRowAtIndexPathBlock) {
        self.didDeselectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}



@end
