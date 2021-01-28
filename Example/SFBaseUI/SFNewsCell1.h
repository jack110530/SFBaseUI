//
//  SFNewsCell1.h
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SFBaseUI/SFBaseUI.h>
#import <SFCategory/SFCategory.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFNewsCell1 : UITableViewCell<SFMvvmViewProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *comment;

@end

NS_ASSUME_NONNULL_END
