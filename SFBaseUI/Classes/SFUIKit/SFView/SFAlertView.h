//
//  SFAlertView.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SFActionBlock)(NSInteger tag);

@interface SFAlertView : NSObject

@property (nonatomic, copy) SFActionBlock alertBlcok;
@property (nonatomic, copy) SFActionBlock sheetBlcok;


#pragma mark dismiss
+ (void)dismiss:(UIAlertController *)alert;


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
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;


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
        otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;



@end

NS_ASSUME_NONNULL_END
