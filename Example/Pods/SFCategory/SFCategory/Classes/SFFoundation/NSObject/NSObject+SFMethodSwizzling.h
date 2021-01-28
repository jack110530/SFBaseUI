//
//  NSObject+SFMethodSwizzling.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SFMethodSwizzling)

+ (void)sf_swizzlingClassMethod:(SEL)originalSel swizzledMethod:(SEL)swizzledMethod withClass:(Class)targetClass;
+ (void)sf_swizzlingInstanceMethod:(SEL)originalSel swizzledMethod:(SEL)swizzledMethod withClass:(Class)targetClass;

@end

NS_ASSUME_NONNULL_END
