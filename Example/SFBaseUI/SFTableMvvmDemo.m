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

@interface SFTableMvvmDemo ()
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) SFNewsViewModel *tableViewViewModel;
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
    
    self.tableViewViewModel = [SFNewsViewModel viewModelWithTableView:self.tableView];
    [self.tableViewViewModel loadData];
}



#pragma mark - getter
- (SFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SFTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
