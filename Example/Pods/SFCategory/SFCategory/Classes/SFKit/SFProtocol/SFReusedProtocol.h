//
//  SFReusedProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFReusedProtocol <NSObject>

@required
/// 是否从xib中加载
@property (class,nonatomic,assign,readonly) BOOL sf_loadFromNib;
/// 重用标识
@property (class,nonatomic,copy,readonly) NSString *sf_reuseIdentifier;


@end

NS_ASSUME_NONNULL_END
