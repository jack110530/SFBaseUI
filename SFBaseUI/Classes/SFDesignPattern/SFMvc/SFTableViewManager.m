//
//  SFTableViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import "SFTableViewManager.h"
#import "SFMvcModelProtocol.h"
// model
#import "SFListModel.h"
#import "SFSectionModel.h"
#import "SFCellModel.h"


@interface SFTableViewManager ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSObject<SFListModelProtocol> *listModel;
@end

@implementation SFTableViewManager

#pragma mark - init
+ (instancetype)managerWithTableView:(__kindof UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(__kindof UITableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        // 初始化数据
        SFSectionModel *sectionModel = [[SFSectionModel alloc]init];
        self.listModel = [[SFListModel alloc]init];
        self.listModel.sf_sectionModels = @[sectionModel];
    }
    return self;
}



#pragma mark - 数据源操作
// MARK: section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)setSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels {
    self.listModel.sf_sectionModels = sectionModels;
}

/// 追加section
/// @param sectionModel section数据模型
- (void)appendSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel {
    [self appendSectionModels:@[sectionModel]];
}

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)appendSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels {
    [self insertSectionModels:sectionModels atIndex:self.listModel.sf_sectionModels.count-1];
}

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)insertSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel
                   atIndex:(NSInteger)index {
    [self insertSectionModels:@[sectionModel] atIndex:index];
}

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)insertSectionModels:(NSArray<NSObject<SFSectionModelProtocol> *> *)sectionModels
                    atIndex:(NSInteger)index {
    NSArray *oldSectionModels = self.listModel.sf_sectionModels;
    NSMutableArray *newSectionModels = [NSMutableArray arrayWithArray:oldSectionModels];
    NSUInteger i = index;
    for (id obj in sectionModels) {
        [newSectionModels insertObject:obj atIndex:i++];
    }
    self.listModel.sf_sectionModels = newSectionModels.copy;
}


// MARK: cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)setCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel {
    if (!sectionModel) {
        return;
    }
    sectionModel.sf_cellModels = cellModels;
}

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)appendCellModel:(NSObject<SFCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel {
    [self appendCellModels:@[cellModel] inSectionModel:sectionModel];
}

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)appendCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel {
    [self insertCellModels:cellModels inSectionModel:sectionModel atIndex:sectionModel.sf_cellModels.count-1];
}

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModel:(NSObject<SFCellModelProtocol> *)cellModel inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index {
    [self insertCellModels:@[cellModel] inSectionModel:sectionModel atIndex:index];
}

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)insertCellModels:(NSArray<NSObject<SFCellModelProtocol> *> *)cellModels inSectionModel:(NSObject<SFSectionModelProtocol> *)sectionModel atIndex:(NSInteger)index {
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
    return self.listModel.sf_sectionModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return sectionModel.sf_cellModels.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    if ([cellModel conformsToProtocol:@protocol(SFMvcModelProtocol)]) {
        __kindof NSObject<SFCellModelProtocol,SFMvcModelProtocol> *mvcCellModel = (__kindof NSObject<SFCellModelProtocol,SFMvcModelProtocol> *)cellModel;
        __kindof UITableViewCell *cell = [tableView sf_dequeueCell:mvcCellModel.sf_viewCls indexPath:indexPath];
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
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    return [cellModel.sf_height floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return [sectionModel.sf_headerHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return [sectionModel.sf_footerHeight floatValue];
}

// estimatedHeight
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    return [cellModel.sf_estimatedHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return [sectionModel.sf_estimatedHeaderHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return [sectionModel.sf_estimatedFooterHeight floatValue];
}

// section header & footer
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return sectionModel.sf_header;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[section];
    return sectionModel.sf_footer;
}

// cell select & deselect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    __kindof UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectRowAtIndexPathBlock) {
        self.didSelectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof NSObject<SFSectionModelProtocol> *sectionModel = self.listModel.sf_sectionModels[indexPath.section];
    __kindof NSObject<SFCellModelProtocol> *cellModel = sectionModel.sf_cellModels[indexPath.row];
    __kindof UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didDeselectRowAtIndexPathBlock) {
        self.didDeselectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}



@end
