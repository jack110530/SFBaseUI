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
@property (nonatomic, copy) NSArray<NSObject<SFTableViewCellModelProtocol> *> *sf_cellModels;
@property (nonatomic, strong) UIView *sf_header;
@property (nonatomic, strong) UIView *sf_footer;
@property (nonatomic, strong) NSNumber *sf_headerHeight;
@property (nonatomic, strong) NSNumber *sf_footerHeight;
@property (nonatomic, strong) NSNumber *sf_estimatedHeaderHeight;
@property (nonatomic, strong) NSNumber *sf_estimatedFooterHeight;

@end

NS_ASSUME_NONNULL_END
