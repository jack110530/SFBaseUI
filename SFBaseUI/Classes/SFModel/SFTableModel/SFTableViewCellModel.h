//
//  SFTableViewCellModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFCustomUIProtocol.h"
#import "SFTableViewReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewCellModel : NSObject

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) Class<SFCustomUIProtocol,SFTableViewReusedProtocol> cls;

@end

NS_ASSUME_NONNULL_END
