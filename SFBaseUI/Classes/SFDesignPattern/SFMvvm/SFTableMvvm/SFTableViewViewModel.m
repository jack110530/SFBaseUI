//
//  SFTableViewViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "SFTableViewCellViewModel.h"


@interface SFTableViewViewModel ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SFTableView *tableView;
@end

@implementation SFTableViewViewModel

#pragma mark - init
+ (instancetype)viewModelWithTableView:(__kindof SFTableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        [self configTableView];
    }
    return self;
}
- (void)configTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // 数据绑定
    RAC(self.tableView, tableHeaderView) = RACObserve(self, tableModel.header);
    RAC(self.tableView, tableFooterView) = RACObserve(self, tableModel.footer);
    [RACObserve(self, tableModel) subscribeNext:^(id  _Nullable x) {
        [self.tableView reloadData];
    }];
    
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
    __kindof SFTableViewCellViewModel *cellViewModel = [SFTableViewCellViewModel viewModelWithTableViewCell:cell];
    if (self.cellForRowAtIndexPathBlock) {
        self.cellForRowAtIndexPathBlock(self.tableView, cell, cellModel, indexPath);
    }
    return cell;
}

// MARK: UITableViewDelegate
// Variable height support
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[indexPath.section];
//    SFTableViewCellModel *cellModel = sectionModel.cellModels[indexPath.row];
//    return cellModel.height;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return sectionModel.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    __kindof SFTableViewSectionModel *sectionModel = self.tableModel.sectionModels[section];
    return sectionModel.footerHeight;
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
