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

@end