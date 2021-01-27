//
//  SFCollectionViewReusedProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <Foundation/Foundation.h>
#import "SFReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFCollectionViewReusedProtocol <SFReusedProtocol>


@optional
#pragma mark - for collectionView
// MARK: 注册cell
/// 注册cell
/// @param cell cell类对象
- (void)sf_registerCell:(nonnull Class<SFReusedProtocol>)cell;

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells;


// MARK: 注册header
/// 注册header
/// @param header header类对象
- (void)sf_registerHeader:(nonnull Class<SFReusedProtocol>)header;

/// 注册header
/// @param headers header类对象（数组）
- (void)sf_registerHeaders:(NSArray<Class<SFReusedProtocol>> *)headers;


// MARK: 注册footer
/// 注册footer
/// @param footer footer类对象
- (void)sf_registerFooter:(nonnull Class<SFReusedProtocol>)footer;

/// 注册footer
/// @param footers footer类对象（数组）
- (void)sf_registerFooters:(NSArray<Class<SFReusedProtocol>> *)footers;



// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UICollectionViewCell *)sf_dequeueCell:(nullable Class<SFReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath;

/// 出队header
/// @param header header类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueHeader:(nullable Class<SFReusedProtocol>)header kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;

/// 出队footer
/// @param footer footer类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueFooter:(nullable Class<SFReusedProtocol>)footer kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
