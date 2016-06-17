//
//  RecommendViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/31.
//  Copyright © 2016年 张精申. All rights reserved.
//



#import "RecommendViewController.h"
#import <Masonry.h>
#import "HTTP.h"
#import "RecommendTableViewCell.h"
#import "RecommendDetailCell.h"
#import <MJRefresh/MJRefresh.h>
@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* leftTableView;
@property(nonatomic,strong)UITableView* rightTableView;

@property(nonatomic,strong)NSArray* RecommendArray;
@property(nonatomic,strong)NSMutableArray* RecommendDetailArray;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupLeftTableView];
    [self loadLeftData];
    [self setupRightTbaleView];
}
-(void)setupNavi{
    self.navigationItem.title=@"推荐关注";
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
-(void)setupLeftTableView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    UITableView* left=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    left.separatorStyle = UITableViewCellSeparatorStyleNone;
    left.dataSource=self;
    left.delegate=self;
    self.leftTableView=left;
    self.leftTableView.separatorStyle=UITableViewCellEditingStyleNone;
    [self.view addSubview:self.leftTableView];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(64);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(self.view.width/4);
        make.left.mas_equalTo(self.view.mas_left);
    }];
}
-(void)setupRightTbaleView{

    
    UITableView* rightTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    rightTableView.delegate=self;
    rightTableView.dataSource=self;
    self.rightTableView=rightTableView;
    [self.view addSubview:self.rightTableView];
    [rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTableView.mas_right);
        make.bottom.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
    }];
    rightTableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}
#pragma -mark 网络相关
-(void)loadLeftData{
    [[HTTP shareManager]getRecommendTitle:^(NSArray *love) {
        self.RecommendArray=love;
        [self.leftTableView reloadData];
        //默认点第一个
        [self tableView:self.leftTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];

    } failed:^(NSError *hate) {
        MYLog(@"%@",hate);
    }];
}
-(void)sendRequestForLoadMore:(Recommend* )recommend{
    //发送请求要求获得下一页
    [[HTTP shareManager]getRecommendDetail:^(NSArray *getDetail) {
        
        [recommend.deatilArray addObjectsFromArray:getDetail];
        if (recommend.deatilArray.count==recommend.count) {
            [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.rightTableView.mj_footer endRefreshing];
        }
        [self.rightTableView reloadData];
    } failed:^(NSError *fuck) {
        MYLog(@"加载更多出现了问题:%@",fuck);
    } WithCategory_id:(NSString* )recommend.categoryID WithPage:recommend.currentPage];
}
-(void)loadMore{
    NSIndexPath* indexPath=[self.leftTableView indexPathForSelectedRow];
    Recommend* category=self.RecommendArray[indexPath.row];
    if (category.currentPage==0) {
        category.currentPage++ ;
    }
    category.currentPage=category.currentPage+1;
    [self sendRequestForLoadMore:category];
}

#pragma -mark @protocol UITableViewDataSource<NSObject>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.leftTableView) {
        return self.RecommendArray.count;
    }else{
        return self.RecommendDetailArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.leftTableView) {
        RecommendTableViewCell* cell=[RecommendTableViewCell cellWithTableView:tableView];
    cell.recommend=self.RecommendArray[indexPath.row];
    cell.isSelected=NO;
    return cell;
    }else{
        RecommendDetailCell* cell=[RecommendDetailCell cellForRecommendDetail:tableView];
        cell.user=self.RecommendDetailArray[indexPath.row];
        return cell;
    }
    
}
//将开头的一小块弄了，不能返回0，返回0等于没设置
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.leftTableView) {
         RecommendTableViewCell* cell=[tableView cellForRowAtIndexPath:indexPath];
         cell.isSelected=YES;
    [[HTTP shareManager]getRecommendDetail:^(NSArray *getDetail) {
        Recommend* sel=self.RecommendArray[indexPath.row];
        [sel.deatilArray addObjectsFromArray:getDetail];
        self.RecommendDetailArray=sel.deatilArray;
                [self.rightTableView reloadData];
        if (sel.deatilArray.count==sel.count) {
            [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
        }

    } failed:^(NSError *fuck) {
        MYLog(@"获取推荐详情错误：%@",fuck);
    } WithCategory_id:(NSString* )cell.recommend.categoryID WithPage:cell.recommend.currentPage];
    }

    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (tableView==self.leftTableView) {
        RecommendTableViewCell* cell=[tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected=NO;
    }
}
@end
