//
//  SFTableViewCellViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/14.
//

#import "SFTableViewCellViewModel.h"

@interface SFTableViewCellViewModel ()
@property (nonatomic, strong) SFTableViewCell *cell;
@end

@implementation SFTableViewCellViewModel

#pragma mark - init
//+ (instancetype)viewModelWithTableViewCell:(SFTableViewCell *)cell {
//    return [[self alloc] viewModelWithTableViewCell:cell];
//}
//- (instancetype)viewModelWithTableViewCell:(SFTableViewCell *)cell {
////    if (self = [super initw]) {
////        self.cell = cell;
////        [self configTableViewCell];
//    }
//    return self;
//}
- (void)configTableViewCell {
    // 数据绑定
    if (self.dataBindingBlock) {
        self.dataBindingBlock(self.cell, self.cellModel);
    }
}

@end
