//
//  UITableViewHeaderFooterView+SFReuse.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/27.
//

#import "UITableViewHeaderFooterView+SFReuse.h"
#import "NSObject+SFExtension.h"

@implementation UITableViewHeaderFooterView (SFReuse)

+ (NSString *)sf_reuseIdentifier {
    return self.sf_className;
}
+ (BOOL)sf_loadFromNib {
    return NO;
}

@end
