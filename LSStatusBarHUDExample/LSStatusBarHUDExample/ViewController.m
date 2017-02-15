//
//  ViewController.m
//  LSStatusBarHUDExample
//
//  Created by 刘松 on 16/12/6.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "ViewController.h"
#import "LSStatusBarHUD.h"

#import "CustomHUD.h"

@interface ViewController ()



@property(nonatomic,strong) UIWindow *l;
    
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)yktip:(id)sender
    {
        
    [LSStatusBarHUD showMessage:@"正在努力加载数据..."];
        
    
    
}

- (IBAction)error:(id)sender {
    NSLog(@"1111111111");
     [LSStatusBarHUD showMessageAndImage:@"播放错误"];
    
    
}
- (IBAction)loading:(id)sender {
    [LSStatusBarHUD showLoading:@"正在努力加载数据..."];

    
}
- (IBAction)hideLoading:(id)sender {
    
    [LSStatusBarHUD hideLoading];
    
}
- (IBAction)customTip:(id)sender {
    
    [CustomHUD showMessage:@"哈哈哈哈哈哈哈哈"];
}
- (IBAction)customLoading:(id)sender {
     [CustomHUD showLoading:@"正在疯狂加载中..."];
    
}
- (IBAction)qq:(id)sender {
    
    NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:@"已发送" color:[UIColor blackColor] font:[UIFont systemFontOfSize:16]];
    
    [LSStatusBarHUD showMessageAndImage:a image:[UIImage imageNamed:@"success.png"] backgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    
}



@end
