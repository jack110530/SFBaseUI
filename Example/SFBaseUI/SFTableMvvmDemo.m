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

@interface SFTableMvvmDemo ()
@property (nonatomic, strong) SFTableView *tableView;
@property (nonatomic, strong) SFTableViewViewModel *tableViewViewModel;
@end

@implementation SFTableMvvmDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFTableMvvmDemo";
    
    self.tableViewViewModel = [SFTableViewViewModel viewModelWithTableView:self.tableView];
}

- (SFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SFTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
