//
//  NSObject+SFExtension.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "NSObject+SFExtension.h"

@implementation NSObject (SFExtension)
+ (NSString *)sf_className {
    return NSStringFromClass(self);
}
- (NSString *)sf_className {
    return NSStringFromClass([self class]);
}
@end
