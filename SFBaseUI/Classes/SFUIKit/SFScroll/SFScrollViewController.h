//
//  SFScrollViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFScrollViewController : SFViewController

@property (nonatomic, strong, readonly) UIScrollView *scrollView;
@property (nonatomic, strong, readonly) UIView *contentView;

@end

NS_ASSUME_NONNULL_END
