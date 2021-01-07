//
//  SFViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFViewController.h"

@interface SFViewController ()

@end

@implementation SFViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)loadView {
    [super loadView];
    [self customUI];
}

#pragma mark - custom ui
- (void)customUI {
    // 自定义UI
}

#pragma mark - customLayout
- (void)viewWillLayoutSubviews {
    // 自定义布局
    [super viewWillLayoutSubviews];
}



@end
