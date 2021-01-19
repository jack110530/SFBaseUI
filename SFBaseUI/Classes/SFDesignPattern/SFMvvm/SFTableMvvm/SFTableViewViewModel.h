//
//  SFTableViewViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
// manager
#import "SFTableViewManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewViewModel : NSObject

@property (nonatomic, strong) SFTableViewManager *tableViewManager;

#pragma mark - init
+ (instancetype)viewModelWithTableView:(__kindof SFTableView *)tableView;
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView;

@end

NS_ASSUME_NONNULL_END
