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
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SFTableViewController


- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super init]) {
        [self customTableViewWithStyle:style];
    }
    return self;
}
- (void)customTableViewWithStyle:(UITableViewStyle)style {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.tableView) {
        [self customTableViewWithStyle:UITableViewStylePlain];
    }
    [self.view addSubview:self.tableView];
}


@end
