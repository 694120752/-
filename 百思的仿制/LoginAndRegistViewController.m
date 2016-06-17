//
//  LoginAndRegistViewController.m
//  百思的仿制
//
//  Created by 张精申 on 16/6/12.
//  Copyright © 2016年 张精申. All rights reserved.
//

#import "LoginAndRegistViewController.h"

@interface LoginAndRegistViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;

@end

@implementation LoginAndRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)regist:(UIButton *)sender {
    
    if (sender.selected==NO) {
        [sender setTitle:@"已有账号？" forState: UIControlStateNormal];
        sender.titleLabel.font=[UIFont systemFontOfSize:15];
        sender.selected=YES;
        self.leftMargin.constant=-self.view.width;
        self.left.constant=-self.view.width;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }else{
        [sender setTitle:@"账号注册" forState:0];
        sender.backgroundColor=[UIColor clearColor];
        [sender setTitleColor:[UIColor whiteColor] forState:0];
        sender.titleLabel.font=[UIFont systemFontOfSize:15];
        sender.selected=NO;
        self.leftMargin.constant=self.leftMargin.constant+self.view.width;
        self.left.constant=self.view.width;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
