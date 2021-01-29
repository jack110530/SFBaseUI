//
//  SFTableViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewController : SFViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong,readonly) UITableView *tableView;
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end

NS_ASSUME_NONNULL_END
