//
//  MeViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/18.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "MeViewController.h"
#import "MeCell.h"
#import "MefootView.h"
#import "SettingViewController.h"

@interface MeViewController ()
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupNavi];
}
-(void)setupTableView{
    self.view.backgroundColor=GolbalColor;
    self.tableView.sectionHeaderHeight= 0;
    self.tableView.sectionFooterHeight= 10;
    self.tableView.contentInset=UIEdgeInsetsMake(-25, 0, -20, 0);
    self.tableView.tableFooterView=[[MefootView alloc]init];
}
-(void)setupNavi{
        self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.rightBarButtonItems= @[[UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)],[UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)]];
}
-(void)moonClick{
    
}
-(void)settingClick{
    SettingViewController* setting=[[SettingViewController alloc]init];
    setting.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:setting animated:YES];
    
}
#pragma mark -<tableViewDelegate>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier=@"MeCell";
    MeCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[MeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.section==0) {
        cell.textLabel.text=@"登录/注册";
        cell.imageView.image=[UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text=@"离线下载";
    }
    return cell;
}

@end
