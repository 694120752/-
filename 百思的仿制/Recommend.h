//
//  Recommend.h
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.7
//

#import <Foundation/Foundation.h>

@interface Recommend : NSObject
/**推荐分类的ID*/
@property(nonatomic,assign) NSNumber*  categoryID;
/**推荐分类的名字*/
@property(nonatomic,strong) NSString* name;
/**推荐分类的个数*/
@property(nonatomic,assign) NSInteger  count;


/**
 
 解决网络不好的问题，加载过之后存入到之前类的属性中
 不主动加载显示之前的内容
 
 */



/**当前的页数*/
@property(nonatomic,assign)NSInteger currentPage;
/**显示详细的标签*/
@property(nonatomic,strong)NSMutableArray* deatilArray;

@end
