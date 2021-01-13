//
//  SFTableViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFTableViewController.h"
#import <SFMacro/SFFunc.h>
#import <Masonry/Masonry.h>

@interface SFTableViewController ()
@property (nonatomic,strong) SFTableView *tableView;
@end

@implementation SFTableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - config UI
- (void)customUI {
    [super customUI];
    self.tableStyle = UITableViewStylePlain;
}


#pragma mark - custom layout
- (void)viewWillLayoutSubviews {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super viewWillLayoutSubviews];
}


#pragma mark - setter
- (void)setTableStyle:(UITableViewStyle)tableStyle {
    _tableStyle = tableStyle;
    if (self.tableView) {
        [self.tableView removeFromSuperview];
    }
    self.tableView = [[SFTableView alloc]initWithFrame:CGRectZero style:tableStyle];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}



@end
