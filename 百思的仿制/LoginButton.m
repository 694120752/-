//
//  LoginButton.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/12.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "LoginButton.h"

@implementation LoginButton



-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y=0;
    self.imageView.centerX=self.width*0.5;
    self.titleLabel.centerX=self.width*0.5;
    self.titleLabel.y=self.imageView.height;
    
}

@end
