//
//  FriendViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/18.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "FriendViewController.h"
#import "LoginAndRegistViewController.h"
#import "RecommendViewController.h"
@interface FriendViewController ()

@end


@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=Color(214, 214, 214, 1.0);
    [self setNavi];
    
    
}
- (IBAction)loginButton:(id)sender {
    UIStoryboard * storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];    LoginAndRegistViewController* login=[storyBoard instantiateViewControllerWithIdentifier:@"login"];
    
    [self presentViewController:login animated:YES completion:nil];
    
}
-(void)setNavi{
    self.navigationItem.title=@"我的关注";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    UIBarButtonItem* item=[UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(getRecommend)];
    self.navigationItem.leftBarButtonItem=item;
}
-(void)getRecommend{
    RecommendViewController* recommend=[[RecommendViewController alloc]init];
    recommend.view.backgroundColor=[UIColor whiteColor];
    recommend.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:recommend animated:YES];
}
@end
