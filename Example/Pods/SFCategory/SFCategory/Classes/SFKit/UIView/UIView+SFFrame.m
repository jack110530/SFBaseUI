//
//  UIView+SFFrame.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIView+SFFrame.h"

@implementation UIView (SFFrame)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

@end
