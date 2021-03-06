//
//  SFMvcModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>
#import <SFCategory/SFCategory.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvcModelProtocol <NSObject>

@optional
/// View类对象
@property (nonatomic, strong) Class<SFReusedProtocol> sf_viewCls;

@end

NS_ASSUME_NONNULL_END
