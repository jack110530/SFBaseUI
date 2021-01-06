//
//  UIView+SFFrame.h
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SFFrame)

// 这里只写了x,y 其他的YY里面有
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@end

NS_ASSUME_NONNULL_END
