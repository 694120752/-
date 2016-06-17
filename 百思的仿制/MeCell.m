//
//  Me.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/14.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return  self;
}


@end
