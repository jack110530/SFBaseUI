//
//  SFTableViewReusedProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <Foundation/Foundation.h>
#import "SFReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFTableViewReusedProtocol <SFReusedProtocol>

@optional
// MARK: 注册section
/// 注册section
/// @param section section类对象
- (void)sf_registerSection:(nullable Class<SFTableViewReusedProtocol>)section;

/// 注册section
/// @param sections section类对象（数组）
- (void)sf_registerSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections;

/// 注册section（nib）
/// @param section section类对象
- (void)sf_registerNibSection:(nullable Class<SFTableViewReusedProtocol>)section;

/// 注册section（nib）
/// @param sections section类对象（数组）
- (void)sf_registerNibSections:(NSArray<Class<SFTableViewReusedProtocol>> *)sections;

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UITableViewCell *)sf_dequeueCell:(nullable Class<SFTableViewReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath;

/// 出队section
/// @param section section
- (nullable __kindof UITableViewHeaderFooterView *)sf_dequeueSection:(nullable Class<SFTableViewReusedProtocol>)section;

@end

NS_ASSUME_NONNULL_END
