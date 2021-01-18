//
//  SFTableViewModel.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import "SFModelProtocol.h"
#import "SFTableViewSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFTableViewModel : NSObject<SFModelProtocol>

@property (nonatomic, copy) NSArray<SFTableViewSectionModel *> *sectionModels;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIView *footer;

@end

NS_ASSUME_NONNULL_END
