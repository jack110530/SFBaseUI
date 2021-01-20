//
//  SFNewsCell2ViewModel.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/18.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFNewsCell2ViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

#import "SFNewsCell2.h"
#import "SFNewsModel.h"

@interface SFNewsCell2ViewModel ()

@property (nonatomic, weak) SFNewsCell2 *cell;
@property (nonatomic, weak) SFNewsModel *model;

@end

@implementation SFNewsCell2ViewModel

- (void)sf_bindingWithView:(SFNewsCell2 *)cell {
    self.cell = cell;
    RAC(self.cell, title) = RACObserve(self, model.title);
    RAC(self.cell, desc) = RACObserve(self, model.desc);
    RAC(self.cell, img) = RACObserve(self, model.img);
}
- (void)sf_updateWithModel:(SFNewsModel *)model {
    self.model = model;
}


@end
