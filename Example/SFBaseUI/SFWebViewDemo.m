//
//  SFWebViewDemo.m
//  SFBaseUI_Example
//
//  Created by 黄山锋 on 2021/1/29.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFWebViewDemo.h"

@interface SFWebViewDemo ()

@end

@implementation SFWebViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"https://www.baidu.com";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}



@end
