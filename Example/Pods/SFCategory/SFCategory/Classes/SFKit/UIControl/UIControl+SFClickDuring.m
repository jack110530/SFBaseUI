//
//  UIControl+SFClickDuring.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/27.
//

#import "UIControl+SFClickDuring.h"
#import "NSObject+SFMethodSwizzling.h"
#import <objc/runtime.h>

@interface UIControl ()
@property (nonatomic, assign) BOOL eventInvalid;
@end

@implementation UIControl (SFClickDuring)

+ (void)load {
    [self sf_swizzlingInstanceMethod:@selector(sendAction:to:forEvent:) swizzledMethod:@selector(sf_sendAction:to:forEvent:) withClass:[self class]];
}


- (void)sf_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (!self.eventInvalid) {
        self.eventInvalid = YES;
        [self sf_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setEventInvalid:) withObject:@(NO) afterDelay:self.clickDuring];
    }
}


#pragma mark - setter/getter
- (void)setClickDuring:(NSTimeInterval)clickDuring {
    objc_setAssociatedObject(self, @selector(clickDuring), [NSNumber numberWithDouble:clickDuring], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)clickDuring {
    return [objc_getAssociatedObject(self, @selector(clickDuring)) doubleValue];
}
- (void)setEventInvalid:(BOOL)eventInvalid {
    objc_setAssociatedObject(self, @selector(eventInvalid), [NSNumber numberWithBool:eventInvalid], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)eventInvalid {
    return [objc_getAssociatedObject(self, @selector(eventInvalid)) boolValue];
}


@end
