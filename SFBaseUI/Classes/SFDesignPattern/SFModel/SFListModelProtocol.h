//
//  SFListModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import "SFSectionModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFListModelProtocol <NSObject>

@required
@property (nonatomic, copy) NSArray<NSObject<SFSectionModelProtocol> *> *sf_sectionModels;
@property (nonatomic, strong) UIView *sf_header;
@property (nonatomic, strong) UIView *sf_footer;

@end

NS_ASSUME_NONNULL_END
