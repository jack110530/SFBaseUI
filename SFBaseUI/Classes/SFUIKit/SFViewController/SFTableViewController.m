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
        self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)loadView {
    if (!self.tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    self.view = self.tableView;
}


@end
