//
//  SFMvcModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/19.
//

#import <Foundation/Foundation.h>
#import "SFCustomUIProtocol.h"
#import "SFTableViewReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFMvcModelProtocol <NSObject>

@optional
@property (nonatomic, strong) Class<SFCustomUIProtocol,SFTableViewReusedProtocol> viewCls;

@end

NS_ASSUME_NONNULL_END
