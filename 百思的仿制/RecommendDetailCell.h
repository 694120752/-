//
//  RecommendDetailCell.h
//  百思的仿制
//
//  Created by 张精申 on 16/6/6.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendUser.h"
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>
@interface RecommendDetailCell : UITableViewCell
+(instancetype)cellForRecommendDetail:(UITableView* )tableView;

@property(nonatomic,strong)RecommendUser* user;
@end
