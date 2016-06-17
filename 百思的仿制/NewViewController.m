//
//  NewViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/18.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* titleView=[[UIImageView alloc]init];
    titleView.image=[UIImage imageNamed:@"MainTitle"];
    [titleView sizeToFit];
    self.navigationItem.titleView=titleView;
    UIButton* button=[[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];

    [button sizeToFit];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];

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
