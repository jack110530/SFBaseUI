//
//  SFAlertView.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/2/2.
//

#import "SFAlertView.h"


@implementation SFAlertView

#pragma mark dismiss
+ (void)dismiss:(UIAlertController *)alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - show
/// 弹窗alert
/// @param viewController 用于显示alert的controller
/// @param title 标题
/// @param message 提示内容
/// @param cancelTitle 取消按钮名称
/// @param block 点击按钮的回调
/// @param otherButtonTitles 其他按钮
+ (UIAlertController *)showAlertIn:(UIViewController *)viewController
              title:(NSString *)title
            message:(NSString *)message
        cancelTitle:(NSString *)cancelTitle
        actionBlock:(SFActionBlock)block
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    // 创建alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    // 下面两行代码 是修改 title颜色和字体的代码
    /*
     NSAttributedString *attributedMessage = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f], NSForegroundColorAttributeName:[UIColor redColor]}];
     [alert setValue:attributedMessage forKey:@"attributedTitle"];
      */
    
    // 添加cancel action
    if (cancelTitle) {
        UIAlertAction  *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block(0);
        }];
        [alert addAction:cancelAction];
    }
    
    // 读取可变参数里面的titles数组
    NSMutableArray *otherTitleArray = [[NSMutableArray alloc] initWithCapacity:0];
    va_list list;
    if(otherButtonTitles) {
        //1.取得第一个参数的值(即是buttonTitles)
        [otherTitleArray addObject:otherButtonTitles];
        //2.从第2个参数开始，依此取得所有参数的值
        NSString *otherTitle;
        va_start(list, otherButtonTitles);
        while ((otherTitle = va_arg(list, NSString*))) {
            [otherTitleArray addObject:otherTitle];
        }
        va_end(list);
    }
    
    // 添加other action
    if (otherTitleArray.count>0) {
        for (NSInteger i = 0; i<otherTitleArray.count; i++) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                block(i+1);
            }];
            // [action setValue:[UIColor redColor] forKey:@"titleTextColor"]; // 此代码 可以修改按钮颜色
            [alert addAction:otherAction];
        }
    }
    
    // present
    [viewController presentViewController:alert animated:YES completion:nil];
    return alert;
}


/// 弹窗actionSheet
/// @param viewController 用于显示actionSheet的controller
/// @param title 标题
/// @param message 提示内容
/// @param cancelTitle 取消按钮名称
/// @param sureTitle 确定按钮名称
/// @param block 点击按钮的回调
/// @param otherButtonTitles 其他按钮
+ (UIAlertController *)showActionSheetIn:(UIViewController *)viewController
                    title:(NSString *)title
                  message:(NSString *)message
              cancelTitle:(NSString *)cancelTitle
                sureTitle:(NSString *)sureTitle
              actionBlock:(SFActionBlock)block
        otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    // 创建alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    // 下面两行代码 是修改 title颜色和字体的代码
    /*
     NSAttributedString *attributedMessage = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f], NSForegroundColorAttributeName:[UIColor redColor]}];
     [alert setValue:attributedMessage forKey:@"attributedTitle"];
      */
    
    // 添加cancel action
    if (cancelTitle) {
        UIAlertAction  *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block(0);
        }];
        [alert addAction:cancelAction];
    }
    
    // 添加sure action
    if (sureTitle) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            block(1);
        }];
        [alert addAction:sureAction];
    }
    
    // 读取可变参数里面的titles数组
    NSMutableArray *otherTitleArray = [[NSMutableArray alloc] initWithCapacity:0];
    va_list list;
    if(otherButtonTitles) {
        //1.取得第一个参数的值(即是buttonTitles)
        [otherTitleArray addObject:otherButtonTitles];
        //2.从第2个参数开始，依此取得所有参数的值
        NSString *otherTitle;
        va_start(list, otherButtonTitles);
        while ((otherTitle = va_arg(list, NSString*))) {
            [otherTitleArray addObject:otherTitle];
        }
        va_end(list);
    }
    
    // 添加other action
    if (otherTitleArray.count>0) {
        for (NSInteger i = 1; i<=otherTitleArray.count; i++) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                block(i+1);
            }];
            // [action setValue:[UIColor redColor] forKey:@"titleTextColor"]; // 此代码 可以修改按钮颜色
            [alert addAction:otherAction];
        }
    }
    
    // present
    [viewController presentViewController:alert animated:YES completion:nil];
    return alert;
}



@end
