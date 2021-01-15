//
//  SFNewsViewModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsViewModel.h"

// model
#import "SFNewsModel.h"

// view
#import "SFNewsCell1.h"
#import "SFNewsCell2.h"


@implementation SFNewsViewModel

#pragma mark - init
- (instancetype)initWithTableView:(SFTableView *)tableView {
    if (self = [super initWithTableView:tableView]) {
        self.cellForRowAtIndexPathBlock = ^(__kindof SFTableView * _Nonnull tableView, __kindof SFTableViewCell * _Nonnull cell, __kindof SFTableViewCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
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
    }
    return self;
}


// 通知数据层（Model）获取数据 -> 获取到数据 -> 通知视图层（View）更新数据
- (void)loadData {
    __weak typeof(self) weakSelf = self;
//    [SFNewsModel getDatasSuccess:^(NSArray<SFNewsModel *> * _Nonnull models) {
//        SFTableViewSectionModel *sectionModel = [[SFTableViewSectionModel alloc]init];
//        sectionModel.cellModels = models;
//        SFTableViewModel *tableModel = [[SFTableViewModel alloc]init];
//        tableModel.sectionModels = @[sectionModel];
//        weakSelf.tableModel = tableModel;
//    }];
}


@end
