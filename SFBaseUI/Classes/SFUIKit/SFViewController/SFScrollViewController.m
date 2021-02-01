//
//  SFScrollViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFScrollViewController.h"
#import <SFMacro/SFMacro.h>
#import <Masonry/Masonry.h>

@interface SFScrollViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation SFScrollViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.greaterThanOrEqualTo(self.scrollView);
    }];
}

#pragma mark - getter
SFLazyLoad(UIScrollView, scrollView, {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
})
SFLazyLoad(UIView, contentView, {
    _contentView = [[UIView alloc]initWithFrame:CGRectZero];
    _contentView.backgroundColor = [UIColor whiteColor];
})




@end
