//
//  SFTableViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewModel.h"

@implementation SFTableViewModel

// YYModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sectionModels":[SFTableViewSectionModel class]};
}

#pragma mark - getter
- (NSArray<SFTableViewSectionModel *> *)sectionModels {
    if (!_sectionModels) {
        SFTableViewSectionModel *sectionModel = [[SFTableViewSectionModel alloc]init];
        _sectionModels = @[sectionModel];
    }
    return _sectionModels;
}


@end
