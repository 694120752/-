//
//  SettingViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/15.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "SettingViewController.h"
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>
#import "NSString+XMGExtension.h"
#import "SettingCell.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController
static NSString* identifier=@"setCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=GolbalColor;
    self.title=@"设置";
    [self setupNavi];
    [self setupTable];
    
    
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
-(void)setupTable{
    UITableView* tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(-24);
    }];
    [tableView registerClass:[SettingCell class] forCellReuseIdentifier:identifier];
}

#pragma mark - <tableViewDelegate>
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
   
    
    if (cell==nil) {
        cell=[[SettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
        
    
    
    return cell;
}

@end
