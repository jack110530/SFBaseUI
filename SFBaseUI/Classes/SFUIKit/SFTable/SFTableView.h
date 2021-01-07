//
//  SFTableView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "SFCustomUIProtocol.h"
#import "SFTableViewReusedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableView : UITableView<SFCustomUIProtocol,SFTableViewReusedProtocol>


@end

NS_ASSUME_NONNULL_END