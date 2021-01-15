//
//  SFTableViewManager.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/15.
//

#import <Foundation/Foundation.h>
#import "SFTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewManager : NSObject
@property (nonatomic, strong, readonly) SFTableView *tableView;

#pragma mark - init
+ (instancetype)managerTableView:(__kindof SFTableView *)tableView;
- (instancetype)initWithTableView:(__kindof SFTableView *)tableView;

@end

NS_ASSUME_NONNULL_END
