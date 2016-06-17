//
//  MeWebViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/15.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "MeWebViewController.h"
#import "UIBarButtonItem+Extension.h"
@interface MeWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MeWebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;

@end

@implementation MeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.MeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    self.MeWebView.delegate=self;
    [self setupNavi];
    
}

-(void)setupNavi{
    
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIBarButtonItem* leftButton=[[UIBarButtonItem alloc]initWithCustomView:button];
    button.contentEdgeInsets=UIEdgeInsetsMake(0, -30, 0, 0);
    self.navigationItem.leftBarButtonItem=leftButton;
    
    
}
-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 监听点击
- (IBAction)refresh:(UIBarButtonItem* )sender {
    [self.MeWebView reload];
}
- (IBAction)back:(UIBarButtonItem* )sender {
    [self.MeWebView goBack];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.backItem.enabled=webView.canGoBack;
    
}

@end
