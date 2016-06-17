//
//  SettingCell.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/16.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "SettingCell.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
@implementation SettingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.text=@"清楚缓存(正在计算缓存大小...)";
        self.userInteractionEnabled=NO;
        
        UIActivityIndicatorView* loading= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loading startAnimating];
        self.accessoryView=loading;
        dispatch_async(dispatch_get_global_queue(0, 0),^{
            NSInteger cache=[SDImageCache sharedImageCache].getSize;
            NSString *sizeText = nil;
            CGFloat unit = 1000.0;
            if (cache >= unit * unit * unit) { // >= 1GB
                sizeText = [NSString stringWithFormat:@"(%.2fGB)", cache / unit / unit / unit];
            } else if (cache >= unit * unit) { // >= 1MB
                sizeText = [NSString stringWithFormat:@"(%.2fMB)", cache / unit / unit];
            } else if (cache >= unit) { // >= 1KB
                sizeText = [NSString stringWithFormat:@"(%.2fKB)", cache / unit];
            } else { // >= 0B
                sizeText = [NSString stringWithFormat:@"(%zdB)", cache];
            }
            dispatch_async(dispatch_get_main_queue(), ^{

                self.textLabel.text=[NSString stringWithFormat:@"清除缓存 %@",sizeText];
                self.accessoryView=nil;
                self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                
                self.userInteractionEnabled=YES;
                [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearCache)]];

            });
        });
               
        
    }
    return self;
}
-(void)clearCache{
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
#warning 设置个延迟效果好
        [NSThread sleepForTimeInterval:0.25];
       //缓存清楚完毕了
        [SVProgressHUD dismiss];
        self.textLabel.text=@"清除缓存（0B）";
    }];
}
@end
