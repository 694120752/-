//
//  RecommendTableViewCell.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import <Masonry/Masonry.h>
@interface RecommendTableViewCell()
@property(nonatomic,strong)UILabel* lable;
@property(nonatomic,strong)UIView* redView;

@end

@implementation RecommendTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString* identifier=@"Cell";
    RecommendTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[RecommendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupMain];
    }
    return self;
}
-(void)setupMain{
    UIView* redView=[[UIView alloc]init];
    redView.backgroundColor=[UIColor redColor];
    self.redView=redView;
    [self.contentView addSubview:self.redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(5);
    }];
    UILabel* lable=[[UILabel alloc]init];
    self.lable=lable;
    lable.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:self.lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.left.mas_equalTo(0);
    }];
    
    
}
-(void)setRecommend:(Recommend *)recommend{
    
    _recommend=recommend;
    self.lable.text=self.recommend.name;
}
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected=isSelected;
    self.redView.hidden=!isSelected;
}

@end
