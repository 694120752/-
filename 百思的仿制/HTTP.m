//
//  HTTP.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "HTTP.h"
#import "Recommend.h"
#import "RecommendUser.h"
#import "MeSquare.h"
@implementation HTTP
static NSString* baseURL=@"http://api.budejie.com/api/api_open.php";

+(instancetype)shareManager{
    
    static HTTP* http=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        http=[[HTTP alloc]init];
    });
    return http;
}
//Friend
-(void)getRecommendTitle:(void (^)(NSArray *))success failed:(void (^)(NSError* ))failed{
    
    NSMutableDictionary* parameter=[NSMutableDictionary dictionary];
    parameter[@"a"]=@"category";
    parameter[@"c"]=@"subscribe";
    [[AFHTTPSessionManager manager]GET:baseURL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray* dicArray=[responseObject valueForKey:@"list"];
        NSMutableArray* recommendArray=[NSMutableArray array];
        for (NSDictionary* dic in dicArray) {
            Recommend* recommend=[[Recommend alloc]init];
            [recommend setValuesForKeysWithDictionary:dic];
            [recommendArray addObject:recommend];
           
        }
        success(recommendArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
}
//Friend
-(void)getRecommendDetail:(void(^)(NSArray* getDetail))success failed:(void(^)(NSError* fuck))failed WithCategory_id:(NSString* )category_id WithPage:(NSInteger)page
{
    if (page<=1) {
        page=1;
    }
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[@"a"]=@"list";
    dic[@"c"]=@"subscribe";
    dic[@"category_id"]=category_id;
    dic[@"page"]=@(page);
    [[AFHTTPSessionManager manager]GET:baseURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray* dicArray=responseObject[@"list"];
        NSArray* modelArray=[RecommendUser mj_objectArrayWithKeyValuesArray:dicArray];
        
        success(modelArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}
//Me
-(void)getMe:(void(^)(NSArray* getMe))success failed:(void(^)(NSError* error))failed{
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[@"a"]=@"square";
    dic[@"c"]=@"topic";
    
    
    [[AFHTTPSessionManager manager]GET:baseURL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*   _Nullable responseObject) {
        NSArray* square=responseObject[@"square_list"];
        NSArray* modelArray=[MeSquare mj_objectArrayWithKeyValuesArray:square];
        success(modelArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
    
}
@end
