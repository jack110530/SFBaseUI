//
//  SFTableViewSectionModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewSectionModel.h"

@implementation SFTableViewSectionModel

// YYModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"cellModels":[SFTableViewCellModel class]};
}

#pragma mark - getter
- (NSArray<SFTableViewCellModel *> *)cellModels {
    if (!_cellModels) {
        _cellModels = @[];
    }
    return _cellModels;
}


@end
