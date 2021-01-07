//
//  SFCollectionViewCell.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/7.
//

#import "SFCollectionViewCell.h"
#import <SFCategory/NSObject+SFExtension.h>

@implementation SFCollectionViewCell

#pragma mark - getter
+ (NSString *)sf_reuseIdentifier {
    return self.sf_className;
}
+ (BOOL)sf_loadFromNib {
    return NO;
}

@end
