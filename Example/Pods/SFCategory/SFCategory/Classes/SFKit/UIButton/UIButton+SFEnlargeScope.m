//
//  UIButton+SFEnlargeScope.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIButton+SFEnlargeScope.h"
#import "NSObject+SFMethodSwizzling.h"
#import <objc/runtime.h>

@implementation UIButton (SFEnlargeScope)

+ (void)load
{
    [self sf_swizzlingInstanceMethod:@selector(pointInside:withEvent:) swizzledMethod:@selector(sf_pointInside:withEvent:) withClass:[self class]];
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
