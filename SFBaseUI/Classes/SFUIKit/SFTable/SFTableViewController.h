//
//  SFTableViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFViewController.h"
#import "SFTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewController : SFViewController<UITableViewDataSource, UITableViewDelegate>
/// 默认UITableViewStylePlain
@property (nonatomic, assign) UITableViewStyle tableStyle;
@property (nonatomic,strong,readonly) SFTableView *tableView;
@end

NS_ASSUME_NONNULL_END
