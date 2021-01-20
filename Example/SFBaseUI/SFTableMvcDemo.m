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

@end

@implementation SFTableMvcDemo


/*
 Controller调度层：
 生成view，然后组装view
 响应View的事件和作为view的代理
 调用model的数据获取接口，拿到返回数据，处理加工，渲染到view显示
 处理view的生命周期
 处理界面之间的跳转
 
 Model数据层：
 业务逻辑封装
 提供数据接口给controller使用
 数据持久化存储和读取
 作为数据模型存储数据
 
 View视图层：
 界面元素搭建，动画效果，数据展示，
 接受用户操作并反馈视觉效果
 */


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
    
    // 视图层数据展示
    self.tableViewManager.cellForRowAtIndexPathBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof NSObject<SFTableViewCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
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
    // 点击cell
    self.tableViewManager.didSelectRowAtIndexPathBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof NSObject<SFTableViewCellModelProtocol> * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        
    };
    
    // View视图层页面交互 通知 Controller调度层去获取数据
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self loadDataWithPage:self.page];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page++;
        [self loadDataWithPage:self.page];
    }];
    
    // 
    [self.tableView.mj_header beginRefreshing];
}

// Controller调度层 通知 数据层去获取数据
- (void)loadDataWithPage:(NSInteger)page {
    __weak typeof(self) weakSelf = self;
    [SFNewsModel getWithPage:page datasSuccess:^(NSArray<SFNewsModel *> * _Nonnull models) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        // 获取到数据 -> 逻辑处理，数据组装
        NSObject<SFTableViewSectionModelProtocol> *sectionModel = weakSelf.tableViewManager.tableModel.sectionModels[0];
        if (self.page == 0) {
            [weakSelf.tableViewManager setCellModels:models inSectionModel:sectionModel];
        }else{
            [weakSelf.tableViewManager appendCellModels:models inSectionModel:sectionModel];
        }
        // Controller调度层 通知 视图层更新页面
        [weakSelf.tableViewManager.tableView reloadData];
    }];
}


#pragma mark - getter
- (SFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SFTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}


@end
