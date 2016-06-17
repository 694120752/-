//
//  MeSquareButton.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/15.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "MeSquareButton.h"

@implementation MeSquareButton

-(void)layoutSubviews{
    [super layoutSubviews];
    //要先设置w和h最后再centerX
    self.imageView.width = self.width * 0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.y = self.height * 0.1;
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.x = 0;
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.textAlignment =NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font=[UIFont systemFontOfSize:15];
}

@end
