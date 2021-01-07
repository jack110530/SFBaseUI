//
//  SFReusedProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFReusedProtocol <NSObject>

@optional
/// 是否从xib中加载
@property (class,nonatomic,assign,readonly) BOOL sf_loadFromNib;
/// 重用标识
@property (class,nonatomic,copy,readonly) NSString *sf_reuseIdentifier;

/// 注册cell
/// @param cell cell类对象
- (void)sf_registerCell:(nullable Class<SFReusedProtocol>)cell;

/// 注册cell
/// @param cells cell类对象（数组）
- (void)sf_registerCells:(NSArray<Class<SFReusedProtocol>> *)cells;

/// 注册cell（nib）
/// @param cell cell类对象
- (void)sf_registerNibCell:(nullable Class<SFReusedProtocol>)cell;

/// 注册cell（nib）
/// @param cells cell类对象（数组）
- (void)sf_registerNibCells:(NSArray<Class<SFReusedProtocol>> *)cells;

@end

NS_ASSUME_NONNULL_END
