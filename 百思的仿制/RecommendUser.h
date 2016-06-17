//
//  RecommendUser.h
//  百思的仿制
//
//  Created by 张精申 on 16/6/4.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendUser : NSObject
/**uid*/
@property(nonatomic,strong)NSString* uid;
/**详细的名字*/
@property(nonatomic,strong)NSString* screen_name;
/**introduction介绍*/
@property(nonatomic,strong)NSString* introduction;
/**粉丝数量*/
@property(nonatomic,strong)NSString* fans_count;
/**帖子数量*/
@property(nonatomic,assign)NSNumber* tiezi_count;
/**头像（NSString格式）*/
@property(nonatomic,strong)NSString* header;
/**性别*/
@property(nonatomic,assign)NSNumber* gender;
/**是否跟随*/
@property(nonatomic,assign)BOOL is_follow;


@end
