//
//  MefootView.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/14.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "MefootView.h"
#import "HTTP.h"
#import "MeSquare.h"
#import <UIImageView+WebCache.h>
#import "MeSquareButton.h"
#import "MeWebViewController.h"
@interface MefootView()
@property(nonatomic,strong)NSMutableDictionary <NSString* ,MeSquare*>* allSquare;

@end

@implementation MefootView
-(NSMutableDictionary<NSString *,MeSquare *> *)allSquare{
    if (_allSquare==nil) {
        _allSquare=[NSMutableDictionary dictionary];
    }
    return _allSquare;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [[HTTP shareManager]getMe:^(NSArray *getMe) {
            [self creatSquare:getMe];
        } failed:^(NSError *error) {
            MYLog(@"获取Me中出错了:%@",error);
        }];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}
//创建小按钮的控件
-(void)creatSquare:(NSArray* )getMe{
    NSUInteger count=getMe.count;
    CGFloat buttonW=self.width/4;//一行四个
    CGFloat buttonH=buttonW;
    for (NSUInteger i=0; i<count; i++) {
        MeSquare* square=getMe[i];
        //字典无序，必须要这样！！
        self.allSquare[square.name]=square;
        MeSquareButton* button=[MeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        button.x=(i%4)*buttonW;
        button.y=(i/4)*buttonH;
        button.width=buttonW;
        button.height=buttonH;
        [button setTitle:square.name forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"setup-head-default"] forState:UIControlStateNormal];
        [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:square.icon] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            [button setImage:image forState:UIControlStateNormal];
        }];
    }
    self.height=self.subviews.lastObject.y+self.subviews.lastObject.height;
    //在数据好的时候重新定义foot的高度
    UITableView* tableView=(UITableView* )self.superview;
    tableView.tableFooterView=self;
}
-(void)buttonClick:(UIButton* )button{
    MeSquare* square=self.allSquare[button.currentTitle];
    if ([square.url hasPrefix:@"http"]) {
        UIStoryboard * storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];        MeWebViewController* webView=[storyBoard instantiateViewControllerWithIdentifier:@"MeWeb"];
        webView.url=square.url;
        webView.navigationItem.title=square.name;
        //拿到控制器
        UITabBarController* tabbar=(UITabBarController* )self.window.rootViewController;
        UINavigationController* navi=tabbar.childViewControllers.lastObject;
        webView.hidesBottomBarWhenPushed=YES;
        [navi pushViewController:webView animated:YES];
        
    }else if([square.url hasPrefix:@"mod"]){
        MYLog(@"mod开头的");
    }else{
        MYLog(@"既不是http也不是mod，新的开头");
    }
}

@end
