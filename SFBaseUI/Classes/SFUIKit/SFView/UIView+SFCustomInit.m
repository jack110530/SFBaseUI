//
//  UIView+SFCustomInit.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/26.
//

#import "UIView+SFCustomInit.h"
#import <objc/runtime.h>

@implementation UIView (SFCustomInit)

+ (void)load {
    sf_swizzlingMethod([self class], NO, @selector(initWithFrame:), @selector(sf_initWithFrame:));
    sf_swizzlingMethod([self class], NO, @selector(initWithCoder:), @selector(sf_initWithCoder:));
}

- (instancetype)sf_initWithFrame:(CGRect)frame {
    typeof(self) obj = [self sf_initWithFrame:frame];
    [obj customInit];
    return obj;
}

- (instancetype)sf_initWithCoder:(NSCoder *)coder {
    typeof(self) obj = [self sf_initWithCoder:coder];
    [obj customInit];
    return obj;
}

- (void)customInit {
    // 在子类中自定义
    
}


/// 交换类方法
/// @param class 类/元类
/// @param originalSel 原方法
/// @param swizzledSel 交换方法
void sf_swizzlingMethod(Class class, BOOL isMetaClass, SEL originalSel, SEL swizzledSel) {
    Method originalMethod;
    Method swizzledMethod;
    if (isMetaClass) {
        originalMethod = class_getClassMethod(class, originalSel);
        swizzledMethod = class_getClassMethod(class, swizzledSel);
    }else{
        originalMethod = class_getInstanceMethod(class, originalSel);
        swizzledMethod = class_getInstanceMethod(class, swizzledSel);
    }
    if (!originalMethod || !swizzledMethod) {
        NSLog(@"【Class】：%@中，方法交换失败 \n【originalSel】：%@ \n【swizzledSel】：%@ \n", class, NSStringFromSelector(originalSel), NSStringFromSelector(swizzledSel));
        return;
    }
    if (isMetaClass) {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }else{
        BOOL didAddMethod = class_addMethod(class,
                                             originalSel,
                                             method_getImplementation(swizzledMethod),
                                             method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSel,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}

@end
