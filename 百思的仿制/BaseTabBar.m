//
//  BaseTabBar.m
//  百思的仿制
//
//  Created by 张精申 on 16/5/19.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "BaseTabBar.h"
@interface BaseTabBar()
@property(nonatomic,strong)UIButton* publishButton;
@end
@implementation BaseTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.publishButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:self.publishButton];
    }
    return self;
}
//控制view上的按钮的位置
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger i=0;
    for (UIView* button in self.subviews) {
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGFloat x=(i>1?i+1:i)*(self.frame.size.width/5);
            button.frame=CGRectMake(x, 0, (self.frame.size.width/5), 49.5);
           // MYLog(@"%ld",(long)i);
            i++;
        }
    }
    self.publishButton.bounds=CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
}
@end
