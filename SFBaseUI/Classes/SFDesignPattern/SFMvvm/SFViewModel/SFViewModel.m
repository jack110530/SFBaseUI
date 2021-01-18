//
//  SFViewModel.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/18.
//

#import "SFViewModel.h"

@interface SFViewModel ()
@end

@implementation SFViewModel

#pragma mark - init
+ (instancetype)viewModelWithView:(UIView *)view {
    return [[self alloc]initWithView:view];
}
- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        
    }
    return self;
}

@end
