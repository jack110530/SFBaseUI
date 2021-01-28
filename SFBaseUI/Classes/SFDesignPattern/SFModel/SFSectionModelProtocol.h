//
//  SFSectionModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import "SFCellModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol SFSectionModelProtocol <NSObject>

@required
@property (nonatomic, copy) NSArray<NSObject<SFCellModelProtocol> *> *sf_cellModels;
@property (nonatomic, strong) UIView *sf_header;
@property (nonatomic, strong) UIView *sf_footer;
@property (nonatomic, strong) NSNumber *sf_headerHeight;
@property (nonatomic, strong) NSNumber *sf_footerHeight;
@property (nonatomic, strong) NSNumber *sf_estimatedHeaderHeight;
@property (nonatomic, strong) NSNumber *sf_estimatedFooterHeight;


@end

NS_ASSUME_NONNULL_END
