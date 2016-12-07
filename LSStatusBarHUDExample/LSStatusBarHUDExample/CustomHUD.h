//
//  CustomHUD1.h
//  LSStatusBarHUDExample
//
//  Created by 刘松 on 16/12/7.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LSStatusBarHUD.h"

@interface CustomHUD : NSObject

+(void)showMessage:(NSString*)message;
    
+ (void)showLoading:(NSString*)loading;
    
    
    
@end
