//
//  SFTableMvcDemo.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/15.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFTableMvcDemo.h"
#import <SFBaseUI/SFBaseUI.h>
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>

// model
#import "SFNewsModel.h"
// view
#import "SFNewsCell1.h"
#import "SFNewsCell2.h"

@interface SFTableMvcDemo ()
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) SFTableViewManager *tableViewManager;

// 分页
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) SFTableViewModel *tableModel;

@end

@implementation SFTableMvcDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFTableMvcDemo";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 转交代理（MVC中只是单纯的转交代理，为Controller调度层减压）
    self.tableViewManager = [SFTableViewManager managerTableView:self.tableView];
    self.tableViewManager.cellForRowAtIndexPathBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof SFTableViewCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        if ([cell isKindOfClass:[SFNewsCell1 class]]) {
            SFNewsCell1 *newsCell1 = (SFNewsCell1 *)cell;
            SFNewsModel *newsModel = (SFNewsModel *)cellModel;
            
            newsCell1.title = newsModel.title;
            newsCell1.desc = newsModel.desc;
        }
        else if ([cell isKindOfClass:[SFNewsCell2 class]]) {
            SFNewsCell2 *newsCell2 = (SFNewsCell2 *)cell;
            SFNewsModel *newsModel = (SFNewsModel *)cellModel;
            newsCell2.title = newsModel.title;
            newsCell2.desc = newsModel.desc;
            newsCell2.img = newsModel.img;
        }
    };
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self loadDataWithPage:self.page];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self loadDataWithPage:self.page];
    }];
}

// 通知数据层去获取数据
- (void)loadDataWithPage:(NSInteger)page {
    __weak typeof(self) weakSelf = self;
    [SFNewsModel getWithPage:page datasSuccess:^(NSArray<SFNewsModel *> * _Nonnull models) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        // 获取到数据 -> 逻辑处理，数据组装
        if (self.page == 0) {
            self.tableModel.sectionModels[0].cellModels = models;
        }else{
            NSArray *cellModels = self.tableModel.sectionModels[0].cellModels;
            NSMutableArray *newCellModels = [NSMutableArray arrayWithArray:cellModels];
            [newCellModels addObjectsFromArray:models];
            self.tableModel.sectionModels[0].cellModels = newCellModels;
        }
        // 通知视图层更新页面
        weakSelf.tableViewManager.tableModel = self.tableModel;
    }];
}


#pragma mark - getter
- (SFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SFTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}
- (SFTableViewModel *)tableModel {
    if (!_tableModel) {
        _tableModel = [[SFTableViewModel alloc]init];
    }
    return _tableModel;
}

@end
