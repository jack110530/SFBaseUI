//
//  SFNewsCell1ViewModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/18.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsCell1ViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

#import "SFNewsCell1.h"
#import "SFNewsModel.h"


@interface SFNewsCell1ViewModel ()

@property (nonatomic, weak) SFNewsCell1 *cell;
@property (nonatomic, weak) SFNewsModel *model;

@end

@implementation SFNewsCell1ViewModel

#pragma mark - init
+ (instancetype)viewModelWithView:(UIView<SFMvvmViewProtocol> *)view {
    return [[self alloc]initWithView:view];
}
- (instancetype)initWithView:(SFNewsCell1 *)cell {
    if (self = [super init]) {
        self.cell = cell;
        RAC(self.cell, title) = RACObserve(self, model.title);
        RAC(self.cell, desc) = RACObserve(self, model.desc);
        RACChannelTo(self.cell, comment) = RACChannelTo(self, model.comment);
    }
    return self;
}

#pragma mark - update
- (void)updateDataWithModel:(SFNewsModel *)model {
    self.model = model;
}



@end
