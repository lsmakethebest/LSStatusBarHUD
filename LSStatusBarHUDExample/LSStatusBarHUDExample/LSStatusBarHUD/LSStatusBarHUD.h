//
//  LSStatusBarHUD.h
//  LSStatusBarHUD
//
//  Created by 刘松 on 16/12/6.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSStatusBarHUD : UIWindow

    
    
#pragma mark - 一下方法成对出现的第二个都是可以高度自定义样式的方法，如有需要可以自己在写个类，在那个类里写自己的样式，方便以后自己调用
 #pragma mark - 自定义的参数如果传空就会用默认的样式
    
/*
   1. 会自动隐藏
    showMessageAndImage
    showMessage
 
    2.不会自动隐藏
    showLoading
 
    3.但是不管哪种样式连续显示都会把之前的隐藏，也就是说界面上只会显示最后创建的一个
 
*/
    
    
// QQ音乐加载效果 带加载图片和文字  可以自定义 images如果传空则用默认的loading效果
+ (void)showLoading:(NSString *)loading;
+ (void)showLoading:(NSMutableAttributedString *)attributedLoading images:(NSArray*)images backgroundColor:(UIColor*)backgroundColor;
+(void)hideLoading;
    
    
//  QQ音乐联网错误效果 带图片可以自定义
+ (void)showMessageAndImage:(NSString *)message ;
+ (void)showMessageAndImage:(NSMutableAttributedString *)attributedMessage image:(UIImage*)image backgroundColor:(UIColor*)backgroundColor;
    
    
// 映客提示效果只在中间显示文字
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSMutableAttributedString*)attributedMessage backgroundColor:(UIColor*)backgroundColor;

    
//快速创建富文本
+(NSMutableAttributedString*)createAttributedText:(NSString*)text color:(UIColor*)color font:(UIFont*)font;



@end


@interface UIViewController (LSStatusBarHUD)
    

@property (nonatomic,weak)LSStatusBarHUD *ls_hudWindow;

//防止快速点击闪烁存储上次显示的window
@property (nonatomic,weak)LSStatusBarHUD *ls_tempWindow;
    
    
@end

