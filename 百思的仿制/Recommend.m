//
//  Recommend.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/2.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "Recommend.h"

@implementation Recommend
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.categoryID=value;
    }
}

-(NSMutableArray *)deatilArray{
    if (_deatilArray==nil) {
        _deatilArray=[NSMutableArray new];
    }
    return _deatilArray;
}
@end
