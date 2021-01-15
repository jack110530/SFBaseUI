//
//  SFTableViewManager.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import "SFTableViewManager.h"

@interface SFTableViewManager ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SFTableView *tableView;
@end

@implementation SFTableViewManager

#pragma mark - init
+ (instancetype)managerTableView:(__kindof SFTableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView {
    if (self = [super init]) {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}




@end
