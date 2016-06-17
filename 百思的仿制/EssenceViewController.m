//
//  EssenceViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/18.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "EssenceViewController.h"
#import <Masonry/Masonry.h>
@interface EssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView* indication;
@property(nonatomic,strong)UIView* titleView;
@property(nonatomic,strong)UIButton* selectButton;

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupTitleView];
    [self setupScrollerView];
}
-(void)setupNavi{
            self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIButton * leftButton=[[UIButton alloc]init];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    //
    //就这里，很关键好吧
    //
    [leftButton sizeToFit];
    
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
-(void)setupTitleView{
    UIView * titleView=[[UIView alloc]init];
    titleView.backgroundColor=Color(255, 255, 255, 1.0);
    titleView.height=45;
    titleView.width=self.view.width;
    titleView.x=0;
    titleView.y=64;
    self.titleView=titleView;
    [self.view addSubview:titleView];
    NSArray* titleArray=@[@"全部",@"视频",@"图片",@"段子",@"声音"];
    NSInteger count=4;
    
    CGFloat width=(self.view.width)/(titleArray.count);
    //添加下面滑动的view
    UIView* redView=[[UIView alloc]init];
    
    self.indication=redView;
    redView.backgroundColor=[UIColor redColor];
    redView.height=2;
    redView.y=(titleView.y+titleView.height-1);
    
    
    
    for (int i=0; i<=count; i++) {
        UIButton * button=[[UIButton alloc]init];
        button.tag=i;
        button.x=i*width;
        button.y=0;
        button.width=width;
        button.height=titleView.height;
        button.tag=i;
        
        
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //禁用状态（选中了就不能选）
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [titleView addSubview:button];
        if (i==0) {
            [self titleClick:button];
        }
        
    }
    [self.view addSubview:self.indication];
}
-(void)titleClick:(UIButton* )button{
    self.selectButton.enabled=YES;
    button.enabled=NO;
    self.selectButton=button;
    self.indication.width=button.width;
    self.indication.x=button.x;
}
-(void)setupScrollerView{
    UIScrollView* contentView=[[UIScrollView alloc]init];
    contentView.delegate=self;
    contentView.contentSize=CGSizeMake(self.view.width*5, 0);
    [self.view addSubview:contentView];
   
    //创建一个scroolerView
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.view.width);
        make.bottom.mas_equalTo(49);
        make.top.mas_equalTo(self.titleView.mas_bottom);
    }];
}

#pragma mark-ScrollViewDelegate



@end
