//
//  RecommendDetailCell.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/6.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "RecommendDetailCell.h"
@interface RecommendDetailCell()
@property(nonatomic,strong)UILabel* nameLb;
@property(nonatomic,strong)UIImageView* head;
@end
@implementation RecommendDetailCell
+(instancetype)cellForRecommendDetail:(UITableView* )tableView{
    static NSString* identifier=@"detailCell";
    RecommendDetailCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[RecommendDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupMain];
    }
    
    return self;
}
-(void)setupMain{
    UIImageView* head=[[UIImageView alloc]init];
    [self.contentView addSubview:head];
    self.head=head;
    CGFloat head_height=38;
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(head_height, head_height));
    }];
    head.layer.cornerRadius=head_height/2;
    head.layer.masksToBounds=YES;
    UILabel* nameLB = [[UILabel alloc] init];
    self.nameLb = nameLB;
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(head.mas_right).offset(10);
        make.top.mas_equalTo(head);
    }];

}
-(void)setUser:(RecommendUser *)user{
    _user=user;
    [self.head sd_setImageWithURL:[NSURL URLWithString:user.header]];
    self.nameLb.text=user.screen_name;
    
}

@end
