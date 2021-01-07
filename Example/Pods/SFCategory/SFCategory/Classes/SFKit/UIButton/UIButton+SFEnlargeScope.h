//
//  UIButton+SFEnlargeScope.h
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SFEnlargeScope)

/// 扩大点击范围
@property(nonatomic,assign)UIEdgeInsets enlargeEdge;

@end

NS_ASSUME_NONNULL_END
