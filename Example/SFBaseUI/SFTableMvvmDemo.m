//
//  SFTableMvvmDemo.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFTableMvvmDemo.h"
#import <SFBaseUI/SFBaseUI.h>
#import <Masonry/Masonry.h>
#import "SFNewsViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface SFTableMvvmDemo ()
@property (nonatomic, strong) UITableView<SFMvvmViewProtocol> *tableView;
@property (nonatomic, strong) SFNewsViewModel *newsViewModel;
@end

@implementation SFTableMvvmDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFTableMvvmDemo";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.newsViewModel = [[SFNewsViewModel alloc] init];
    [self.newsViewModel sf_bindingWithView:self.tableView];
    [self.tableView.mj_header beginRefreshing];
}



#pragma mark - getter
- (UITableView<SFMvvmViewProtocol> *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView<SFMvvmViewProtocol> alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
