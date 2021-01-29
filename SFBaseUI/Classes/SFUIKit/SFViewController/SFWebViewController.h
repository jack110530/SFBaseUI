//
//  SFWebViewController.h
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/29.
//

#import <SFBaseUI/SFBaseUI.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFWebViewController : SFViewController<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong, readonly) WKWebView *webView;
/// 进度条颜色，默认greenColor
@property (nonatomic, strong) UIColor *progressTintColor;

- (instancetype)initWithConfiguration:(WKWebViewConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END
