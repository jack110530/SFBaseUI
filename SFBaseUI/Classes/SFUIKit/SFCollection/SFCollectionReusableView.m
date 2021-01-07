//
//  SFCollectionReusableView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionReusableView.h"
#import <SFCategory/NSObject+SFExtension.h>

@implementation SFCollectionReusableView

#pragma mark - getter
+ (NSString *)sf_reuseIdentifier {
    return self.sf_className;
}
+ (BOOL)sf_loadFromNib {
    return NO;
}

@end
