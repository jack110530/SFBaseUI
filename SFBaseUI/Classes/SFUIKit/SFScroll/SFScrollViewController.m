//
//  SFScrollViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFScrollViewController.h"
#import <SFMacro/SFFunc.h>
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
}

#pragma mark - custom ui
- (void)customUI {
    [super customUI];
    [self.scrollView addSubview:self.contentView];
    [self.view addSubview:self.scrollView];
}

#pragma mark - customLayout
- (void)viewWillLayoutSubviews {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.greaterThanOrEqualTo(self.scrollView);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super viewWillLayoutSubviews];
}

#pragma mark - func



#pragma mark - delegate



#pragma mark - setter



#pragma mark - getter
SFLazyLoad(UIScrollView, scrollView, {
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
})
SFLazyLoad(UIView, contentView, {
    _contentView = [[UIView alloc]initWithFrame:CGRectZero];
    _contentView.backgroundColor = [UIColor whiteColor];
})




@end