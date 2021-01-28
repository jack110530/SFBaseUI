//
//  UITableView+SFReuse.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/25.
//

#import <UIKit/UIKit.h>
#import "SFReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (SFReuse)
// MARK: 注册cell
/// 注册cell
/// @param cell cell类对象
- (void)sf_registerCell:(nonnull Class<SFReusedProtocol>)cell;

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells;

// MARK: 注册section
/// 注册section
/// @param section section类对象
- (void)sf_registerSection:(nonnull Class<SFReusedProtocol>)section;

/// 注册section
/// @param sections section类对象（数组）
- (void)sf_registerSections:(NSArray<Class<SFReusedProtocol>> *)sections;

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UITableViewCell *)sf_dequeueCell:(nullable Class<SFReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath;

/// 出队section
/// @param section section
- (nullable __kindof UITableViewHeaderFooterView *)sf_dequeueSection:(nullable Class<SFReusedProtocol>)section;

@end

NS_ASSUME_NONNULL_END
