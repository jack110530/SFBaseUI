//
//  SFTableViewSectionModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewSectionModel : NSObject

@property (nonatomic, copy) NSArray<SFTableViewCellModel *> *cellModels;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIView *footer;
@property (nonatomic, strong) NSNumber *headerHeight;
@property (nonatomic, strong) NSNumber *footerHeight;
@property (nonatomic, strong) NSNumber *estimatedHeaderHeight;
@property (nonatomic, strong) NSNumber *estimatedFooterHeight;

@end

NS_ASSUME_NONNULL_END
