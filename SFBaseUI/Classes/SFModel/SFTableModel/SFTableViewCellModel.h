//
//  SFTableViewCellModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFCustomUIProtocol.h"
#import "SFTableViewReusedProtocol.h"
#import "SFViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewCellModel : NSObject

@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *estimatedHeight;
@property (nonatomic, strong) Class<SFCustomUIProtocol,SFTableViewReusedProtocol> cls;
@property (nonatomic, strong) Class<SFViewModelProtocol> viewModelCls;

@end

NS_ASSUME_NONNULL_END
