//
//  SFTableViewModelProtocol.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import "SFTableViewSectionModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SFTableViewModelProtocol <NSObject>

@required
@property (nonatomic, copy) NSArray<NSObject<SFTableViewSectionModelProtocol> *> *sectionModels;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIView *footer;

@end

NS_ASSUME_NONNULL_END
