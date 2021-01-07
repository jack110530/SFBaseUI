//
//  SFNavigationController.m
//  FBSnapshotTestCase
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "SFNavigationController.h"

@interface SFNavigationController ()

@end

@implementation SFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - delegate
//push时隐藏tabbar
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
