//
//  SFTableViewViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "SFMvvmViewProtocol.h"
#import "SFMvvmModelProtocol.h"

@interface SFTableViewViewModel ()
@property (nonatomic, strong) SFTableViewManager *tableViewManager;
@end

@implementation SFTableViewViewModel

- (void)sf_bindingWithView:(UIView *)view {
    
    // 转交代理
    self.tableViewManager = [SFTableViewManager managerTableView:view];
    
    // 数据绑定
    [RACObserve(self.tableViewManager, tableModel) subscribeNext:^(id  _Nullable x) {
        [self.tableViewManager.tableView reloadData];
    }];
    [RACObserve(self.tableViewManager.tableModel, sf_sectionModels) subscribeNext:^(id  _Nullable x) {
        [self.tableViewManager.tableView reloadData];
    }];
    RAC(self.tableViewManager.tableView, tableHeaderView) = RACObserve(self.tableViewManager.tableModel, sf_header);
    RAC(self.tableViewManager.tableView, tableFooterView) = RACObserve(self.tableViewManager.tableModel, sf_footer);    
    
    self.tableViewManager.mvvmBindingBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof NSObject<SFTableViewCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        if ([cell conformsToProtocol:@protocol(SFMvvmViewProtocol)]) {
            __kindof SFTableViewCell<SFMvvmViewProtocol> *mvvmCell = (SFTableViewCell<SFMvvmViewProtocol> *)cell;
            if ([cellModel conformsToProtocol:@protocol(SFMvvmModelProtocol)]) {
                __kindof NSObject<SFTableViewCellModelProtocol,SFMvvmModelProtocol> *mvvmCellModel = (__kindof NSObject<SFTableViewCellModelProtocol,SFMvvmModelProtocol> *)cellModel;
                if (!mvvmCell.sf_viewModel) {
                    Class cls = mvvmCellModel.sf_viewModelCls;
                    mvvmCell.sf_viewModel = [[cls alloc]init];
                    [mvvmCell.sf_viewModel sf_bindingWithView:mvvmCell];
                }
            }
        }
    };
    
    // 数据更新
    self.tableViewManager.mvvmUpdateBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof NSObject<SFTableViewCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        if ([cell conformsToProtocol:@protocol(SFMvvmViewProtocol)]) {
            __kindof SFTableViewCell<SFMvvmViewProtocol> *mvvmCell = (SFTableViewCell<SFMvvmViewProtocol> *)cell;
            if ([cellModel conformsToProtocol:@protocol(SFMvvmModelProtocol)]) {
                __kindof NSObject<SFTableViewCellModelProtocol,SFMvvmModelProtocol> *mvvmCellModel = (__kindof NSObject<SFTableViewCellModelProtocol,SFMvvmModelProtocol> *)cellModel;
                [mvvmCell.sf_viewModel sf_updateWithModel:mvvmCellModel];
            }
        }
    };
}

- (void)sf_updateWithModel:(__kindof id<SFMvvmModelProtocol>)model {
    
}



@end
