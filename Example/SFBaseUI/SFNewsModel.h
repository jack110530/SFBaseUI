//
//  SFNewsModel.h
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/14.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SFBaseUI/SFBaseUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFNewsModel : SFTableViewCellModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *img;

#pragma mark - 模拟网络请求
+ (void)getWithPage:(NSInteger)page datasSuccess:(void(^)(NSArray<SFNewsModel *> *models))success;

@end

NS_ASSUME_NONNULL_END
