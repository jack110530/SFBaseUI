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
// MARK: 注册header
/// 注册header
/// @param header header类对象
- (void)sf_registerHeader:(nullable Class<SFCollectionViewReusedProtocol>)header;

/// 注册header
/// @param headers header类对象（数组）
- (void)sf_registerHeaders:(NSArray<Class<SFCollectionViewReusedProtocol>> *)headers;

/// 注册header（nib）
/// @param header header类对象
- (void)sf_registerNibHeader:(nullable Class<SFCollectionViewReusedProtocol>)header;

/// 注册header（nib）
/// @param headers header类对象（数组）
- (void)sf_registerNibHeaders:(NSArray<Class<SFCollectionViewReusedProtocol>> *)headers;

// MARK: 注册footer
/// 注册footer
/// @param footer footer类对象
- (void)sf_registerFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer;

/// 注册footer
/// @param footers footer类对象（数组）
- (void)sf_registerFooters:(NSArray<Class<SFCollectionViewReusedProtocol>> *)footers;

/// 注册footer（nib）
/// @param footer footer类对象
- (void)sf_registerNibFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer;

/// 注册footer（nib）
/// @param footers footer类对象（数组）
- (void)sf_registerNibFooters:(NSArray<Class<SFCollectionViewReusedProtocol>> *)footers;

// MARK: 出队
/// 出队cell
/// @param cell cell类对象
/// @param indexPath indexPath
- (__kindof UICollectionViewCell *)sf_dequeueCell:(nullable Class<SFCollectionViewReusedProtocol>)cell indexPath:(NSIndexPath *)indexPath;

/// 出队header
/// @param header header类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueHeader:(nullable Class<SFCollectionViewReusedProtocol>)header kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;

/// 出队footer
/// @param footer footer类对象
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeueFooter:(nullable Class<SFCollectionViewReusedProtocol>)footer kind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;

/// 出队占位header/footer
/// @param kind 类型
/// @param indexPath indexPath
- (__kindof UICollectionReusableView *)sf_dequeuePlaceHeaderOrFooterWithKind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
