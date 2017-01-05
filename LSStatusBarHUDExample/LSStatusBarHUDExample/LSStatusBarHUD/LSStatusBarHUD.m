


//
//  LSStatusBarHUD.m
//  LSStatusBarHUD
//
//  Created by 刘松 on 16/12/6.
//  Copyright © 2016年 liusong. All rights reserved.
//

#import "LSStatusBarHUD.h"
#import <objc/runtime.h>

#import "LSStatusBarHUDConst.h"

//屏幕宽度
#define LSStatusBarHUDScreenWidth   [UIScreen mainScreen].bounds.size.width

@interface LSStatusBarHUD ()


@property (nonatomic,weak) UIViewController *parentViewController;
//标志是加载提示还是短暂提示，以防这种bug  loading->提示(每次提示时不管上次是啥提示都会自动隐藏)->手动隐藏  按道理手动隐藏只能隐藏loading提示。但是却把刚创建的正常提示隐藏掉了

@property (nonatomic,assign) BOOL isLoading;

@end


@implementation LSStatusBarHUD


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.windowLevel=UIWindowLevelNormal;
    }
    return self;
}


// QQ音乐加载效果 带图片或loading可以自定义  images如果传空则用默认的loading效果
+ (void)showLoading:(NSMutableAttributedString *)attributedLoading images:(NSArray*)images backgroundColor:(UIColor*)backgroundColor
{
    [LSStatusBarHUD hideLoading];
    //在init里设置背景色frame无效
    LSStatusBarHUD *hud=[self createWindowWithAutoHide:NO];
    hud.isLoading=YES;
    hud.backgroundColor=backgroundColor;
    CGRect frame=CGRectMake(LSStatusBarHUDLeftMargin, (44- LSStatusBarHUDImageWidth)/2+20,LSStatusBarHUDImageWidth, LSStatusBarHUDImageWidth);
    if (images==nil||images.count==0) {
        UIActivityIndicatorView *activityIndicatorView =[[UIActivityIndicatorView alloc]initWithFrame:frame];
        [activityIndicatorView startAnimating];
        [hud addSubview:activityIndicatorView];
    }else{
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
        imageView.animationImages=images;
        imageView.animationRepeatCount=MAXFLOAT;
        imageView.animationDuration=LSStatusBarHUDImageDuration*images.count;
        [hud addSubview:imageView];
        [imageView startAnimating];
        
    }
    CGFloat x=LSStatusBarHUDLeftMargin+LSStatusBarHUDImageWidth+LSStatusBarHUDMiddleMargin;
    UILabel *label=[self createLabelWithAttributedText:attributedLoading textAlignment:NSTextAlignmentLeft];
    label.frame=CGRectMake(x, 20,LSStatusBarHUDScreenWidth-x, 44);
    [hud addSubview:label];
    
}



+(void)showLoading:(NSString *)loading
{
    [LSStatusBarHUD hideLoading];
    NSMutableAttributedString *attributedString=[self createAttributedText:loading color:LSStatusBarHUDDefaultTitleColor font:LSStatusBarHUDDefaultTitleFont];
    [self showLoading:attributedString images:nil backgroundColor:LSStatusBarHUDDefaultLoadingBackgroundColor];
}


//  QQ音乐错误效果 带图片可以自定义
+(void)showMessageAndImage:(NSMutableAttributedString *)attributedMessage image:(UIImage *)image backgroundColor:(UIColor *)backgroundColor
{
    [LSStatusBarHUD hideLoading];
    //在init里设置背景色frame无效
    LSStatusBarHUD *hud=[self createWindowWithAutoHide:YES];
    hud.backgroundColor=backgroundColor;
    CGRect frame=CGRectMake(LSStatusBarHUDLeftMargin, (44- LSStatusBarHUDImageWidth)/2+20,LSStatusBarHUDImageWidth, LSStatusBarHUDImageWidth);
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:LSStatusBarHUDSrcName(@"offline_tip_icon")];
    if (image) {
        imageView.image=image;
    }
    [hud addSubview:imageView];
    
    CGFloat x=LSStatusBarHUDLeftMargin+LSStatusBarHUDImageWidth+LSStatusBarHUDMiddleMargin;
    UILabel *label=[self createLabelWithAttributedText:attributedMessage textAlignment:NSTextAlignmentLeft];
    label.frame=CGRectMake(x, 20,LSStatusBarHUDScreenWidth-x, 44);
    [hud addSubview:label];
}


+ (void)showMessageAndImage:(NSString *)message
{
    [LSStatusBarHUD hideLoading];
    NSMutableAttributedString *attributedString=[self createAttributedText:message color:LSStatusBarHUDDefaultTitleColor font:LSStatusBarHUDDefaultTitleFont];
    [self showMessageAndImage:attributedString image:nil backgroundColor:LSStatusBarHUDDefaultHUDAndImageBackgroundColor];
    
}


#pragma mark - 不带图片   映客提示效果只在中间显示个文字
+(void)showMessage:(NSMutableAttributedString *)attributedMessage backgroundColor:(UIColor *)backgroundColor
{
    [LSStatusBarHUD hideLoading];
    //在init里设置背景色frame无效
    LSStatusBarHUD *hud=[self createWindowWithAutoHide:YES];
    hud.backgroundColor=backgroundColor;
    UILabel *label=[self createLabelWithAttributedText:attributedMessage textAlignment:NSTextAlignmentCenter];
    label.frame=CGRectMake(0, 20,LSStatusBarHUDScreenWidth, 44);
    [hud addSubview:label];
    
}


+(void)showMessage:(NSString *)message
{
    [LSStatusBarHUD hideLoading];
    LSStatusBarHUD *hud=[self createWindowWithAutoHide:YES];
    hud.backgroundColor=LSStatusBarHUDDefaultHUDBackgroundColor;
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:message];
    [attributedString addAttribute:NSForegroundColorAttributeName value:LSStatusBarHUDDefaultTitleColor range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:LSStatusBarHUDDefaultTitleFont range:NSMakeRange(0, attributedString.length)];
    
    UILabel *label=[self createLabelWithAttributedText:attributedString textAlignment:NSTextAlignmentCenter];
    label.frame=CGRectMake(0, 20, LSStatusBarHUDScreenWidth, 44);
    [hud addSubview:label];
    
}


#pragma mark - 辅助类
+(NSMutableAttributedString*)createAttributedText:(NSString*)text color:(UIColor*)color font:(UIFont*)font
{
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}


+(UILabel*)createLabelWithAttributedText:(NSMutableAttributedString*)attributedText textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label=[[UILabel alloc]init];
    label.attributedText=attributedText;
    label.textAlignment=textAlignment;
    return label;
    
}



+(instancetype)createWindowWithAutoHide:(BOOL)autoHide
{
    UIViewController *vc= [UIApplication sharedApplication].keyWindow.rootViewController;
    BOOL exist;
    LSStatusBarHUD *last= vc.ls_hudWindow;
    if (last) {
        
        exist=YES;
        //            [last.layer removeAllAnimations];
        vc.ls_tempWindow=last;
        
    }
    //在init里设置背景色frame无效
    
    /*这里很巧妙的写了一个分类,因为跟控制器必定是UIViewController 所以用分类来保存他，如果不保存变量则window不会显示,
     显示完设置为nil则会销毁
     用户手动保存使用起来又太麻烦
     用单例又不会全部释放，始终会有一个没被释放
     */
    
    LSStatusBarHUD *hud= [[LSStatusBarHUD alloc]init];
    hud.frame=CGRectMake(0, -64, LSStatusBarHUDScreenWidth, 64);
    hud.hidden=NO;
    //        hud.lastHUD=last;
    
    vc.ls_hudWindow=hud;
    hud.parentViewController=vc;
    
    [hud beginShowWithAutoHide:autoHide exist:exist];
    
    return hud;
    
}
+(void)hideLoading
{
    
    UIViewController *vc= [UIApplication sharedApplication].keyWindow.rootViewController;
    [UIApplication sharedApplication].keyWindow.rootViewController.ls_tempWindow=nil;
    LSStatusBarHUD *hud= vc.ls_hudWindow;
    if (hud.isLoading) {
        [hud endShowWithAutoHide:NO delay:0.0f];
    }
    
}
-(void)beginShowWithAutoHide:(BOOL)autoHide exist:(BOOL)exist
{
    
    CGRect frame=self.frame;
    frame.origin.y=0;
    if (exist) {
        self.frame=frame;
        if (autoHide) {
            [self endShowWithAutoHide:autoHide delay:LSStatusBarHUDDelayTime];
        }
        return;
    }
    
    [UIView animateWithDuration:LSStatusBarHUDBeginAnimationTime animations:^{
        self.frame=frame;
    }completion:^(BOOL finished) {
        if (autoHide) {
            [self endShowWithAutoHide:autoHide delay:LSStatusBarHUDDelayTime];
        }
    }];
}



-(void)endShowWithAutoHide:(BOOL)autoHide delay:(CGFloat)delay
{
    
    CGRect frame=self.frame;
    frame.origin.y=-64;
    __weak typeof(self) weakSelf=self;
    
    [UIView animateWithDuration:LSStatusBarHUDEndAnimationTime delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weakSelf.frame=frame;
    } completion:^(BOOL finished) {
        weakSelf.hidden=YES;
        LSStatusBarHUD *hud;
        hud=weakSelf.parentViewController.ls_hudWindow;
        if (hud==weakSelf&&hud!=nil) {
            weakSelf.parentViewController.ls_hudWindow=nil;
            [UIApplication sharedApplication].keyWindow.rootViewController.ls_tempWindow=nil;
        }
    }];
    
}


-(void)dealloc
{
    
    LSLog(@"释放了---------------");
    
}
@end
@implementation UIViewController (LSStatusBarHUD)

-(void)setLs_hudWindow:(LSStatusBarHUD *)ls_hudWindow
{
    objc_setAssociatedObject(self, @selector(ls_hudWindow), ls_hudWindow,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(LSStatusBarHUD *)ls_hudWindow
{
    return objc_getAssociatedObject(self, _cmd);
}


-(void)setLs_tempWindow:(LSStatusBarHUD *)ls_tempWindow
{
    objc_setAssociatedObject(self, @selector(ls_tempWindow), ls_tempWindow,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(LSStatusBarHUD *)ls_tempWindow
{
    return objc_getAssociatedObject(self, _cmd);
}


@end
