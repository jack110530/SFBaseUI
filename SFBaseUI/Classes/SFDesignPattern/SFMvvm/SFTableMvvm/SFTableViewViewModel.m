//
//  SFTableViewViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "SFMvvmProtocol.h"
#import "SFViewModel.h"

@interface SFTableViewViewModel ()
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) SFTableViewModel *tableModel;
@end

@implementation SFTableViewViewModel

#pragma mark - init
+ (instancetype)viewModelWithTableView:(__kindof SFTableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        // 数据绑定
        [RACObserve(self, tableModel) subscribeNext:^(id  _Nullable x) {
            [self.tableView reloadData];
        }];
        [RACObserve(self.tableModel, sectionModels) subscribeNext:^(id  _Nullable x) {
            [self.tableView reloadData];
        }];
        RAC(self.tableView, tableHeaderView) = RACObserve(self.tableModel, header);
        RAC(self.tableView, tableFooterView) = RACObserve(self.tableModel, footer);
        
        // 转交代理
        self.tableViewManager = [SFTableViewManager managerTableView:self.tableView];
        
        // 视图层数据展示
        self.tableViewManager.cellForRowAtIndexPathBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof SFTableViewCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
            if ([cell conformsToProtocol:@protocol(SFMvvmProtocol)]) {
                SFTableViewCell<SFMvvmProtocol> *mvvmCell = (SFTableViewCell<SFMvvmProtocol> *)cell;
                if (!mvvmCell.sf_viewModel) {
                    mvvmCell.sf_viewModel = [cellModel.viewModelCls viewModelWithView:cell];
                }
                [mvvmCell.sf_viewModel updateDataWithModel:cellModel];
            }
        };
    }
    return self;
}





@end
