//
//  SFTableViewSectionModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import "SFTableViewCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFTableViewSectionModelProtocol <NSObject>

@required
@property (nonatomic, copy) NSArray<NSObject<SFTableViewCellModelProtocol> *> *cellModels;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIView *footer;
@property (nonatomic, strong) NSNumber *headerHeight;
@property (nonatomic, strong) NSNumber *footerHeight;
@property (nonatomic, strong) NSNumber *estimatedHeaderHeight;
@property (nonatomic, strong) NSNumber *estimatedFooterHeight;

@end

NS_ASSUME_NONNULL_END
