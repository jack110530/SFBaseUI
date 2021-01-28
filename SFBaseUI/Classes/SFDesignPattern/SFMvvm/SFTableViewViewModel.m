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

- (void)sf_bindingWithView:(UITableView *)tableView {
    if (![tableView isKindOfClass:[UITableView class]]) {
        return;
    }
    // 转交代理
    self.tableViewManager = [SFTableViewManager managerWithTableView:tableView];
    
    // 数据绑定
    [RACObserve(self.tableViewManager, listModel) subscribeNext:^(id  _Nullable x) {
        [self.tableViewManager.tableView reloadData];
    }];
    [RACObserve(self.tableViewManager.listModel, sf_sectionModels) subscribeNext:^(id  _Nullable x) {
        [self.tableViewManager.tableView reloadData];
    }];
    RAC(self.tableViewManager.tableView, tableHeaderView) = RACObserve(self.tableViewManager.listModel, sf_header);
    RAC(self.tableViewManager.tableView, tableFooterView) = RACObserve(self.tableViewManager.listModel, sf_footer);    
    
    self.tableViewManager.mvvmBindingBlock = ^(__kindof UITableView * _Nonnull tableView, __kindof UITableViewCell * _Nonnull cell, __kindof NSObject<SFCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        if ([cell conformsToProtocol:@protocol(SFMvvmViewProtocol)]) {
            __kindof UITableViewCell<SFMvvmViewProtocol> *mvvmCell = (UITableViewCell<SFMvvmViewProtocol> *)cell;
            if ([cellModel conformsToProtocol:@protocol(SFMvvmModelProtocol)]) {
                __kindof NSObject<SFCellModelProtocol,SFMvvmModelProtocol> *mvvmCellModel = (__kindof NSObject<SFCellModelProtocol,SFMvvmModelProtocol> *)cellModel;
                if (!mvvmCell.sf_viewModel) {
                    Class cls = mvvmCellModel.sf_viewModelCls;
                    mvvmCell.sf_viewModel = [[cls alloc]init];
                    [mvvmCell.sf_viewModel sf_bindingWithView:mvvmCell];
                }
            }
        }
    };
    
    // 数据更新
    self.tableViewManager.mvvmUpdateBlock = ^(__kindof UITableView * _Nonnull tableView, __kindof UITableViewCell * _Nonnull cell, __kindof NSObject<SFCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        if ([cell conformsToProtocol:@protocol(SFMvvmViewProtocol)]) {
            __kindof UITableViewCell<SFMvvmViewProtocol> *mvvmCell = (UITableViewCell<SFMvvmViewProtocol> *)cell;
            if ([cellModel conformsToProtocol:@protocol(SFMvvmModelProtocol)]) {
                __kindof NSObject<SFCellModelProtocol,SFMvvmModelProtocol> *mvvmCellModel = (__kindof NSObject<SFCellModelProtocol,SFMvvmModelProtocol> *)cellModel;
                [mvvmCell.sf_viewModel sf_updateWithModel:mvvmCellModel];
            }
        }
    };
}

- (void)sf_updateWithModel:(__kindof id<SFMvvmModelProtocol>)model {
    
}



@end
