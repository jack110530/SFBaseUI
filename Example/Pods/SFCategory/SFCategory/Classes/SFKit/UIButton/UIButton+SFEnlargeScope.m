//
//  UIButton+SFEnlargeScope.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIButton+SFEnlargeScope.h"
#import <objc/runtime.h>

@implementation UIButton (SFEnlargeScope)

+ (void)load
{
    SEL originalSel = @selector(pointInside:withEvent:);
    SEL newSel = @selector(sf_pointInside:withEvent:);
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
}

- (BOOL)sf_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.enlargeEdge, UIEdgeInsetsZero)) {
        return [self sf_pointInside:point withEvent:event];
    } else {
        CGRect frame = CGRectMake(-self.enlargeEdge.left,
                                  -self.enlargeEdge.top,
                                  CGRectGetWidth(self.frame) + self.enlargeEdge.left + self.enlargeEdge.right,
                                  CGRectGetHeight(self.frame) + self.enlargeEdge.top + self.enlargeEdge.bottom);
        if (CGRectContainsPoint(frame, point)) {
            return YES;
        }
        return NO;
    }
}

#pragma mark - setter/getter
- (void)setEnlargeEdge:(UIEdgeInsets)enlargeEdge {
    objc_setAssociatedObject(self, @selector(enlargeEdge), [NSValue valueWithUIEdgeInsets:enlargeEdge], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIEdgeInsets)enlargeEdge {
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    return [value UIEdgeInsetsValue];
}

@end
