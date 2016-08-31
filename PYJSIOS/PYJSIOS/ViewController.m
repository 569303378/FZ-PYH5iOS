//
//  ViewController.m
//  PYJSIOS
//
//  Created by Apple on 16/8/27.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
//增加一行注释 2016 8 31
@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myWebView.delegate = self;
    //适应屏幕
//    self.myWebView.scalesPageToFit = YES;
//    //解决iOS9.2以上黑边问题
    self.myWebView.opaque = NO;
    
    //关闭多点触控
    self.myWebView.multipleTouchEnabled = YES;
    //加载网页中的电话号码，单击可以拨打
    self.myWebView.dataDetectorTypes = YES;
//1.加载网页
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.myWebView loadRequest:request];
    
   //2. 加载本地html文件，在iphone项目里面
    
//     NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    
//     NSURLRequest *request_1 = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
//    
//    [self.myWebView loadRequest:request_1];
    

}

#pragma mark = web代理


//开始加载的时候执行该方法。
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    
}
//加载完成的时候执行该方法。
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //获取网址
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"currentURL:%@", currentURL);
    
    //获取title
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title:%@",title);
    
//    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
//     
//     "script.type = 'text/javascript';"
//     
//     "script.text = \"function myFunction() { "
//     
//     "var field = document.getElementsByName('q')[0];"
//     
//     "field.value='朱祁林';"
//     
//     "document.forms[0].submit();"
//     
//     "}\";"
//     
//     "document.getElementsByTagName('head')[0].appendChild(script);"];
//    
//    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
    

    // 删除
    NSString *str1 = @"var word = document.getElementById('word');";
    NSString *str2 = @"word.remove();";
    
    [webView  stringByEvaluatingJavaScriptFromString:str1];
    [webView  stringByEvaluatingJavaScriptFromString:str2];
    
//     更改 改文字
    NSString *str3 = @"var change = document.getElementsByClassName('change')[0];"
    "change.innerHTML = '把change这个标签修改为－－什么鬼？';";
    [webView stringByEvaluatingJavaScriptFromString:str3];
    
    // 插入图片
    NSString *str4 =@"var img = document.createElement('img');"
    "img.src = '2.jpg';"
    "img.width = '160';"
    "img.height = '80';"
    "document.body.appendChild(img);";
    [webView stringByEvaluatingJavaScriptFromString:str4];
}
//加载出错的时候执行该方法。
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
