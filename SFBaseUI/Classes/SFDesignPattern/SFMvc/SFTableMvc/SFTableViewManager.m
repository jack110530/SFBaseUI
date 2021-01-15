//
//  SFTableViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import "SFTableViewManager.h"

@interface SFTableViewManager ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SFTableView *tableView;
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


#pragma mark - setter
- (void)setTableModel:(SFTableViewModel *)tableModel {
    if (!tableModel) {
        tableModel = [[SFTableViewModel alloc]init];
    }
    _tableModel = tableModel;
    [self.tableView reloadData];
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
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof SFTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
}





@end
