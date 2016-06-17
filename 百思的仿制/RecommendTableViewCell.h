//
//  RecommendTableViewCell.h
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recommend.h"
@interface RecommendTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView* )tableView;
@property(nonatomic,strong)Recommend* recommend;
@property(nonatomic,assign)BOOL isSelected;
@end
