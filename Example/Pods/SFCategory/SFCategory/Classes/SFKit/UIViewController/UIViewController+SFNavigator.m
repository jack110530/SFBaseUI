//
//  UIViewController+SFNavigator.m
//  SFCategory
//
//  Created by 黄山锋 on 2021/1/6.
//

#import "UIViewController+SFNavigator.h"

typedef NS_ENUM(NSUInteger, SFTranslationType) {
    SFTranslationTypeRoot = 0,
    SFTranslationTypePush,
    SFTranslationTypePresent,
};

@implementation UIViewController (SFNavigator)

#pragma mark - 导航栏转场操作
// 判断当前控制器所处状态
- (SFTranslationType)getCurrentTranslationType {
    SFTranslationType type;
    if (self.navigationController) {
        NSArray *vcs = self.navigationController.viewControllers;
        NSInteger idx = [vcs indexOfObject:self];
        if (idx == 0) {
            type = SFTranslationTypeRoot;
        }else{
            type = SFTranslationTypePush;
        }
    }else{
        if (self.presentingViewController) {
            type = SFTranslationTypePresent;
        }else{
            type = SFTranslationTypeRoot;
        }
    }
    return type;
}
- (void)sf_configBackIconWithPop:(UIImage *)popIcon dismiss:(UIImage *)dismissIcon; {
    SFTranslationType type = [self getCurrentTranslationType];
    switch (type) {
        case SFTranslationTypeRoot:
        {
            // nothing
        }
            break;
        case SFTranslationTypePush:
        {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[popIcon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(sf_back)];
        }
            break;
        case SFTranslationTypePresent:
        {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[dismissIcon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(sf_back)];
        }
            break;
            
        default:
            break;
    }
}
- (void)sf_back {
    SFTranslationType type = [self getCurrentTranslationType];
    switch (type) {
        case SFTranslationTypeRoot:
        {
            // nothing
        }
            break;
        case SFTranslationTypePush:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case SFTranslationTypePresent:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}
- (void)sf_push:(UIViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)sf_present:(UIViewController *)vc {
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}



#pragma mark - 导航栏item配置
- (UIBarButtonItem *)sf_setLeftItemWithTitle:(NSString *)title {
    NSArray *items = [self sf_setLeftItemWithTitles:@[title]];
    return items.firstObject;
}
- (UIBarButtonItem *)sf_setRightItemWithTitle:(NSString *)title {
    NSArray *items = [self sf_setRightItemWithTitles:@[title]];
    return items.firstObject;
}
- (UIBarButtonItem *)sf_setLeftItemWithIcon:(NSString *)icon {
    NSArray *items = [self sf_setLeftItemWithIcons:@[icon]];
    return items.firstObject;
}
- (UIBarButtonItem *)sf_setRightItemWithIcon:(NSString *)icon {
    NSArray *items = [self sf_setRightItemWithIcons:@[icon]];
    return items.firstObject;
}
- (NSArray<UIBarButtonItem *> *)sf_setLeftItemWithTitles:(NSArray<NSString *> *)titles {
    NSArray *items = [self titleItemsWithTitles:titles sel:@selector(sf_clickLeftItemEvent:)];
    self.navigationItem.leftBarButtonItems = items;
    return items;
}
- (NSArray<UIBarButtonItem *> *)sf_setRightItemWithTitles:(NSArray<NSString *> *)titles {
    NSArray *items = [self titleItemsWithTitles:titles sel:@selector(sf_clickRightItemEvent:)];
    self.navigationItem.rightBarButtonItems = items;
    return items;
}
- (NSArray<UIBarButtonItem *> *)sf_setLeftItemWithIcons:(NSArray<NSString *> *)icons {
    NSArray *items = [self iconItemsWithIcons:icons sel:@selector(sf_clickLeftItemEvent:)];
    self.navigationItem.leftBarButtonItems = items;
    return items;
}
- (NSArray<UIBarButtonItem *> *)sf_setRightItemWithIcons:(NSArray<NSString *> *)icons {
    NSArray *items = [self iconItemsWithIcons:icons sel:@selector(sf_clickRightItemEvent:)];
    self.navigationItem.rightBarButtonItems = items;
    return items;
}
- (NSArray<UIBarButtonItem *> *)titleItemsWithTitles:(NSArray<NSString *> *)titles sel:(SEL)sel {
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:sel];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateHighlighted];
        item.tag = i;
        [items addObject:item];
    }
    return items.copy;
}
- (NSArray<UIBarButtonItem *> *)iconItemsWithIcons:(NSArray<NSString *> *)icons sel:(SEL)sel {
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < icons.count; i++) {
        NSString *icon = icons[i];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:sel];
        item.tag = i;
        [items addObject:item];
    }
    return items.copy;
}
/// 点击导航栏左侧item
- (void)sf_clickLeftItemEvent:(UIBarButtonItem *)item {
    
}
/// 点击导航栏右侧item
- (void)sf_clickRightItemEvent:(UIBarButtonItem *)item {
    
}

@end
