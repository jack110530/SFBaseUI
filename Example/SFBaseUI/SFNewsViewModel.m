//
//  SFNewsViewModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsViewModel.h"
#import <MJRefresh/MJRefresh.h>

// model
#import "SFNewsModel.h"

// view
#import "SFNewsCell1.h"
#import "SFNewsCell2.h"

@interface SFNewsViewModel ()
// 分页
@property (nonatomic, assign) NSInteger page;
@end


@implementation SFNewsViewModel

#pragma mark - init
- (void)sf_bindingWithView:(UIView<SFMvvmViewProtocol> *)view {
    [super sf_bindingWithView:view];
    // View视图层页面交互 通知 ViewModel 去获取数据
    self.tableViewManager.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self loadDataWithPage:self.page];
    }];
    self.tableViewManager.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self loadDataWithPage:self.page];
    }];
}

- (void)loadDataWithPage:(NSInteger)page {
    __weak typeof(self) weakSelf = self;
    [SFNewsModel getWithPage:page datasSuccess:^(NSArray<SFNewsModel *> * _Nonnull models) {
        [weakSelf.tableViewManager.tableView.mj_header endRefreshing];
        [weakSelf.tableViewManager.tableView.mj_footer endRefreshing];
        // 获取到数据 -> 逻辑处理，数据组装
        NSObject<SFTableViewSectionModelProtocol> *sectionModel = weakSelf.tableViewManager.tableModel.sectionModels[0];
        if (self.page == 0) {
            [weakSelf.tableViewManager setCellModels:models inSectionModel:sectionModel];
        }else{
            [weakSelf.tableViewManager appendCellModels:models inSectionModel:sectionModel];
        }
        // ViewModel 通知 视图层更新页面
        [weakSelf.tableViewManager.tableView reloadData];
    }];
}


@end
