//
//  Login.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/13.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "Login.h"

@implementation Login

-(void)awakeFromNib{
    self.textColor=[UIColor whiteColor];
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];
    
    //监听一个控件的内部事件
    /**
    1. 如果继承自UIControl
     -(void)addTarget.....forControlEvent
    2.代理
     
    3.通知
     
    4.利用内部某些机制
     */
    [self addTarget:self action:@selector(EDChangeBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(EDChangeEnd) forControlEvents:UIControlEventEditingDidEnd];
    
}
-(void)EDChangeBegin{
//    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLable.textColor"];
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];
}
-(void)EDChangeEnd{
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];
}


@end
