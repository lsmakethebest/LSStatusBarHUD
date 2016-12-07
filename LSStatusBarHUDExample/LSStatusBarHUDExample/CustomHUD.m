


//
//  CustomHUD.m
//  LSStatusBarHUDExample
//
//  Created by 刘松 on 16/12/7.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "CustomHUD.h"

@implementation CustomHUD

    
    +(void)showMessage:(NSString *)message
    {
        
       NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:message color:[UIColor redColor] font:[UIFont systemFontOfSize:20]];
        
        [LSStatusBarHUD showMessage:a backgroundColor:[UIColor colorWithRed:0/255.0 green:121/255.0 blue:195/255.0 alpha:1]];
    }
    
    +(void)showLoading:(NSString *)loading
{
         NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:loading color:[UIColor blueColor] font:[UIFont systemFontOfSize:20]];
    NSMutableArray *images=[NSMutableArray array];
    for (int i=1; i<=12; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]]];
    }
    [LSStatusBarHUD showLoading:a images:images backgroundColor:[UIColor yellowColor]];
    
        
    }
@end
