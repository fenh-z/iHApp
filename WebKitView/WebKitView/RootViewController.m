//
//  RootViewController.m
//  WebKitView
//
//  Created by 张栋枭 on 2018/3/28.
//  Copyright © 2018年 JasonZ. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>

@interface RootViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webview;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat buttonBarWidth = 316;
    
    UIView *buttonBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width-buttonBarWidth)/2, 20, buttonBarWidth, 30)];
    
    [self.view addSubview:buttonBar];
    
    UIButton *btnLoadHtml = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnLoadHtml setTitle:@"LoadHTMLData" forState:UIControlStateNormal];
    btnLoadHtml.frame = CGRectMake(0, 0, 117, 30);
    [btnLoadHtml addTarget:self action:@selector(loadHTMLData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBar addSubview:btnLoadHtml];
    
    UIButton *btnLoadData = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnLoadData setTitle:@"LoadData" forState:UIControlStateNormal];
    btnLoadData.frame = CGRectMake(137, 0, 67, 30);
    [btnLoadData addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBar addSubview:btnLoadData];
    
    UIButton *btnLoadReq = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnLoadReq setTitle:@"LoadRequest" forState:UIControlStateNormal];
    btnLoadReq.frame = CGRectMake(224, 0, 92, 30);
    [btnLoadReq addTarget:self action:@selector(loadRequest:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBar addSubview:btnLoadReq];
    
    self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 60, screen.size.width, screen.size.height-80)];
    [self.view addSubview:self.webview];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData:(id)sender{
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    NSLog(@"bundleUrl = %@", bundleUrl);

    NSData *htmlData = [[NSData alloc] initWithContentsOfFile:htmlPath];
    
    NSLog(@"htmlData = %@", htmlData);
   
    [self.webview loadData:htmlData MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:bundleUrl];

}

- (void)loadHTMLData:(id)sender{
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    
    NSLog(@"htmlPath = %@", htmlPath);
    
    NSLog(@"bundelUrl = %@", bundleUrl);

    NSError *error = nil;
    
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"html = %@", html);
    
    if(error == nil){
        [self.webview loadHTMLString:htmlPath baseURL:bundleUrl];
    }
    
}

- (void)loadRequest:(id)sender{
    
    NSLog(@"loadRequest");
    NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com/p/710c84469e22"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"self re");
    [self.webview loadRequest:request];
    self.webview.navigationDelegate =self;
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"开始加载");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"内容开始返回");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败 error : %@", error.description);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
