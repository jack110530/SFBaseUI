//
//  SFWebViewController.m
//  SFBaseUI
//
//  Created by 黄山锋 on 2021/1/29.
//

#import "SFWebViewController.h"
#import <Masonry/Masonry.h>

@interface SFWebViewController ()
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) CALayer *progressLayer;
@end

@implementation SFWebViewController

- (instancetype)initWithConfiguration:(WKWebViewConfiguration *)configuration {
    if (self = [super init]) {
        [self customWebViewWithConfiguration:configuration];
    }
    return self;
}
- (void)customWebViewWithConfiguration:(WKWebViewConfiguration *)configuration {
    self.webView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:configuration];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        WKPreferences *preferences = [WKPreferences new];
        //是否支持JavaScript
        preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        config.preferences = preferences;
        [self customWebViewWithConfiguration:config];
    }
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
    }
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self customProgress];
}


#pragma mark - func
-(void)customProgress{
    UIView *progress = [[UIView alloc]init];
    progress.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3);
    progress.backgroundColor = [UIColor  clearColor];
    [self.view addSubview:progress];
     
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    [progress.layer addSublayer:layer];
    self.progressLayer = layer;
    // 默认绿色
    self.progressTintColor = [UIColor greenColor];
}

#pragma mark - setter
- (void)setProgressTintColor:(UIColor *)progressTintColor {
    _progressTintColor = progressTintColor;
    self.progressLayer.backgroundColor = progressTintColor.CGColor;
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressLayer.opacity = 1;
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progressLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width*[change[@"new"] floatValue], 3);
        if ([change[@"new"]floatValue] == 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressLayer.opacity = 0;
                self.progressLayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else if ([keyPath isEqualToString:@"title"]){
        self.title = change[@"new"];
    }
}

#pragma mark - delegate
// MARK: WKNavigationDelegate
/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
     
}
/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
     
}
/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
     
}
/* 在发送请求之前，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
     
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}


@end
