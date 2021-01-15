//
//  SFTableViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import "SFTableViewManager.h"
#import <YYCategories/YYCategories.h>

@interface SFTableViewManager ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) SFTableViewModel *tableModel;
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
    }
    return self;
}


#pragma mark - section

/// 赋值sectionModels
/// @param sectionModels section数据模型数组
- (void)sf_setSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels {
    self.tableModel.sectionModels = sectionModels;
}

/// 追加section
/// @param sectionModel section数据模型
- (void)sf_appendSectionModel:(SFTableViewSectionModel *)sectionModel {
    [self sf_appendSectionModels:@[sectionModel]];
}

/// 追加一组section
/// @param sectionModels section数据模型数组
- (void)sf_appendSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels {
    [self sf_insertSectionModels:sectionModels atIndex:self.tableModel.sectionModels.count-1];
}

/// 插入section
/// @param sectionModel section数据模型
/// @param index 插入位置
- (void)sf_insertSectionModel:(SFTableViewSectionModel *)sectionModel
                   atIndex:(NSInteger)index {
    [self sf_insertSectionModels:@[sectionModel] atIndex:index];
}

/// 插入一组section
/// @param sectionModels section数据模型数组
/// @param index 插入位置
- (void)sf_insertSectionModels:(NSArray<SFTableViewSectionModel *> *)sectionModels
                    atIndex:(NSInteger)index {
    NSArray *oldSectionModels = self.tableModel.sectionModels;
    NSMutableArray *newSectionModels = [NSMutableArray arrayWithArray:oldSectionModels];
    [newSectionModels insertObjects:sectionModels atIndex:index];
    self.tableModel.sectionModels = newSectionModels.copy;
}


#pragma mark - cell

/// 赋值cellModels
/// @param cellModels cell数据模型数组
- (void)sf_setCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel {
    sectionModel.cellModels = cellModels;
}

/// 追加cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
- (void)sf_appendCellModel:(SFTableViewCellModel *)cellModel inSectionModel:(SFTableViewSectionModel *)sectionModel {
    [self sf_appendCellModels:@[cellModel] inSectionModel:sectionModel];
}

/// 追加一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
- (void)sf_appendCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel {
    [self sf_insertCellModels:cellModels inSectionModel:sectionModel atIndex:sectionModel.cellModels.count-1];
}

/// 插入cell
/// @param cellModel cell数据模型
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)sf_insertCellModel:(SFTableViewCellModel *)cellModel inSectionModel:(SFTableViewSectionModel *)sectionModel atIndex:(NSInteger)index {
    [self sf_insertCellModels:@[cellModel] inSectionModel:sectionModel atIndex:index];
}

/// 插入一组cell
/// @param cellModels cell数据模型数组
/// @param sectionModel 所在section数据模型
/// @param index 插入位置
- (void)sf_insertCellModels:(NSArray<SFTableViewCellModel *> *)cellModels inSectionModel:(SFTableViewSectionModel *)sectionModel atIndex:(NSInteger)index {
    NSArray *oldCellModels = sectionModel.cellModels;
    NSMutableArray *newCellModels = [NSMutableArray arrayWithArray:oldCellModels];
    [newCellModels insertObjects:cellModels atIndex:index];
    sectionModel.cellModels = newCellModels.copy;
}



#pragma mark - delegate
// MARK: UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableModel.sectionModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return sectionModel.cellModels.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
    __kindof SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    __kindof SFTableViewCell *cell = [self.tableView sf_dequeueCell:cellModel.cls indexPath:indexPath];
    if (self.cellForRowAtIndexPathBlock) {
        self.cellForRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
    return cell;
}

// MARK: UITableViewDelegate
// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
    __kindof SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    return [cellModel.height floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return [sectionModel.headerHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return [sectionModel.footerHeight floatValue];
}

// estimatedHeight
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
    __kindof SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    return [cellModel.estimatedHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return [sectionModel.estimatedHeaderHeight floatValue];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return [sectionModel.estimatedFooterHeight floatValue];
}

// section header & footer
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return sectionModel.header;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return sectionModel.footer;
}

// cell select & deselect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
    __kindof SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectRowAtIndexPathBlock) {
        self.didSelectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
    __kindof SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (self.didDeselectRowAtIndexPathBlock) {
        self.didDeselectRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
}


#pragma mark - getter
- (SFTableViewModel *)tableModel {
    if (!_tableModel) {
        _tableModel = [[SFTableViewModel alloc]init];
    }
    return _tableModel;
}


@end
