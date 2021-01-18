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
- (instancetype)initWithView:(SFNewsCell1 *)cell {
    if (self = [super initWithView:cell]) {
        self.cell = cell;
        RAC(self.cell, title) = RACObserve(self, model.title);
        RAC(self.cell, desc) = RACObserve(self, model.desc);
        RACChannelTo(self.cell, comment) = RACChannelTo(self, model.comment);
        
        @weakify(self)
        self.updateDataBlock = ^(SFNewsModel * _Nonnull model) {
            @strongify(self)
            self.model = model;
        };
    }
    return self;
}



@end
