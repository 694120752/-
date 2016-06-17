//
//  baseViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/17.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "baseViewController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendViewController.h"
#import "MeViewController.h"
#import "BaseTabBar.h"
#import "TopNavViewController.h"
@interface baseViewController ()

@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildController];
    [self setValue:[[BaseTabBar alloc]init] forKeyPath:@"tabBar"];

}
-(void)setUpChildController{
    EssenceViewController* EssenceController=[[EssenceViewController alloc]init];
    //标题
    EssenceController.tabBarItem.title=@"精华";
    //图片
    EssenceController.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    UIImage *img = [UIImage imageNamed:@ "tabBar_essence_click_icon" ];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    EssenceController.tabBarItem.selectedImage=img;
    //字体
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    dic[NSForegroundColorAttributeName]=[UIColor grayColor];
    [EssenceController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    NSMutableDictionary* selectDic=[NSMutableDictionary dictionary];
    selectDic[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    [EssenceController.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    TopNavViewController* EssenceNavi=[[TopNavViewController alloc]init];

    [EssenceNavi addChildViewController:EssenceController];
    
    
    NewViewController* NewController=[[NewViewController alloc]init];
    NewController.tabBarItem.title=@"最新";
    NewController.tabBarItem.image=[UIImage imageNamed:@"tabBar_new_icon"];
    UIImage *Newimg = [UIImage imageNamed:@ "tabBar_new_click_icon" ];
    Newimg = [Newimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NewController.tabBarItem.selectedImage=Newimg;
    [NewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [NewController.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    TopNavViewController* NewNavi=[[TopNavViewController alloc]init];
    [NewNavi addChildViewController:NewController];
    
    
    
    
    
    /*
     *
     *
     * 写一半要使用storyboard
     *
    //FriendViewController不使用alloc init 的方法，是用了storyboard的创建方法
    UIStoryboard * storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];//(UIStoryboard*)[[NSBundle mainBundle] pathForResource:@"Main.storyboard" ofType:nil];
    FriendViewController* FriendController=[storyBoard instantiateViewControllerWithIdentifier:@"Friend"];
    
    
     
    除了绑定控制器
    要注意给storyboard中的viewcontroller加上 storyboard ID
     
     *
     *
     */
    UIStoryboard* sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FriendViewController* FriendController=[sb instantiateViewControllerWithIdentifier:@"Friend"];
    FriendController.tabBarItem.title=@"好友";
    FriendController.tabBarItem.image=[UIImage imageNamed:@"tabBar_friendTrends_icon"];
    UIImage *Friendimg = [UIImage imageNamed:@ "tabBar_friendTrends_click_icon" ];
    Friendimg = [Friendimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    FriendController.tabBarItem.selectedImage=Friendimg;
    [FriendController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [FriendController.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    TopNavViewController* FriendNavi=[[TopNavViewController alloc]init];
    [FriendNavi addChildViewController:FriendController];
    
    MeViewController* MeController=[[MeViewController alloc]initWithStyle:UITableViewStyleGrouped];
    MeController.tabBarItem.title=@"我的";
    MeController.tabBarItem.image=[UIImage imageNamed:@"tabBar_me_icon"];
    UIImage *Meimg = [UIImage imageNamed:@ "tabBar_me_click_icon" ];
    Meimg = [Meimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    MeController.tabBarItem.selectedImage=Meimg;
    [MeController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [MeController.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    TopNavViewController* MeNavi=[[TopNavViewController alloc]init];
    [MeNavi addChildViewController:MeController];
   
    
    
    [self addChildViewController:EssenceNavi];
    [self addChildViewController:NewNavi];
    [self addChildViewController:FriendNavi];
    [self addChildViewController:MeNavi];
    
    
}

@end
