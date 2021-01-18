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
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView {
    if (self = [super initWithTableView:tableView]) {
        // View视图层页面交互 通知 Controller调度层去获取数据
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.page = 0;
            [self loadDataWithPage:self.page];
        }];
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.page++;
            [self loadDataWithPage:self.page];
        }];
    }
    return self;
}

// Controller调度层 通知 数据层去获取数据
- (void)loadDataWithPage:(NSInteger)page {
    __weak typeof(self) weakSelf = self;
    [SFNewsModel getWithPage:page datasSuccess:^(NSArray<SFNewsModel *> * _Nonnull models) {
        [weakSelf.tableViewManager.tableView.mj_header endRefreshing];
        [weakSelf.tableViewManager.tableView.mj_footer endRefreshing];
        // 获取到数据 -> 逻辑处理，数据组装
        SFTableViewSectionModel *sectionModel = weakSelf.tableViewManager.tableModel.sectionModels[0];
        if (self.page == 0) {
            [weakSelf.tableViewManager sf_setCellModels:models inSectionModel:sectionModel];
        }else{
            [weakSelf.tableViewManager sf_appendCellModels:models inSectionModel:sectionModel];
        }
        // Controller调度层 通知 视图层更新页面
        [weakSelf.tableViewManager.tableView reloadData];
    }];
}


@end
