//
//  SFCountdownButtonDemo.m
//  SFTool_Example
//
//  Created by 黄山锋 on 2021/1/11.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFCountdownButtonDemo.h"
#import <SFBaseUI/SFBaseUI.h>

@interface SFCountdownButtonDemo ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet SFCountdownButton *getCodeBtn;

@end

@implementation SFCountdownButtonDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFCountdownButtonDemo";
    
    // 倒计时配置
    self.getCodeBtn.during = 10;
    self.getCodeBtn.disableUI = ^(SFCountdownButton * _Nonnull btn) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor grayColor];
    };
    self.getCodeBtn.enableUI = ^(SFCountdownButton * _Nonnull btn) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor orangeColor];
    };
    self.getCodeBtn.loadingColor = [UIColor whiteColor];
    [self.getCodeBtn addTarget:self action:@selector(clickGetCodeBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    self.phoneTextField.delegate = self;
    self.codeTextField.delegate = self;
}


#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *curStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([textField isEqual:self.phoneTextField]) {
        if (curStr.length == 0) {
            [self.getCodeBtn unready];
        }else{
            [self.getCodeBtn ready];
        }
    }
    return YES;
}


// 点击获取验证码
- (void)clickGetCodeBtnEvent:(SFCountdownButton *)sender {
    NSLog(@"点击获取验证码");
    // 这里简单的判断一下长度，具体的手机号判断就不写了
    if (self.phoneTextField.text.length == 11) {
        [self.getCodeBtn loading];
        // 模拟网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 请求成功，开始倒计时
            [self.getCodeBtn start];
            // 请求失败，结束倒计时
            //[self.getCodeBtn finish];
        });
    }else{
        NSLog(@"请输入正确的手机号");
    }
}

#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
