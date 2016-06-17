//
//  HTTP.h
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <MJExtension.h>
@interface HTTP : NSObject
+(instancetype)shareManager;
/**获取推荐的标签*/
-(void)getRecommendTitle:(void (^)(NSArray* love))success failed:(void(^)(NSError* hate))failed;
/**获取标签下的详情*/
-(void)getRecommendDetail:(void(^)(NSArray* getDetail))success failed:(void(^)(NSError* fuck))failed WithCategory_id:(NSString* )category_id WithPage:(NSInteger)page;
/**获取Me中的内容*/
-(void)getMe:(void(^)(NSArray* getMe))success failed:(void(^)(NSError* error))failed;
@end
