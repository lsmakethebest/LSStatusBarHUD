//
//  LSStatusBarHUDConst.h
//  LSStatusBarHUDExample
//
//  Created by 刘松 on 16/12/6.
//  Copyright © 2016年 liusong. All rights reserved.
//

#ifndef LSStatusBarHUDConst_h
#define LSStatusBarHUDConst_h


#define LSStatusBarHUDTest


#ifdef LSStatusBarHUDTest
#define LSLog(...) NSLog(__VA_ARGS__)
#else
#define LSLog(...)
#endif

// 图片路径
#define LSStatusBarHUDSrcName(file) [@"LSStatusBarHUD.bundle" stringByAppendingPathComponent:file]

//常量
#define LSStatusBarHUDBeginAnimationTime 0.3
#define LSStatusBarHUDEndAnimationTime 0.3
#define LSStatusBarHUDDelayTime 1

// RGB颜色
#define LSStatusBarHUDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//加载信息默认背景色
#define LSStatusBarHUDDefaultLoadingBackgroundColor LSStatusBarHUDColor(43, 186, 113)
//图片和文字信息默认背景色
#define LSStatusBarHUDDefaultHUDAndImageBackgroundColor LSStatusBarHUDColor(255, 96, 97)
//中间显示文字默认背景颜色
#define LSStatusBarHUDDefaultHUDBackgroundColor LSStatusBarHUDColor(79, 146, 247)
//文字默认字体
#define LSStatusBarHUDDefaultTitleFont [UIFont systemFontOfSize:16]
//文字默认颜色
#define LSStatusBarHUDDefaultTitleColor [UIColor whiteColor]

//图片距离左边间距
#define LSStatusBarHUDLeftMargin 15
//图片距离文字间距
#define LSStatusBarHUDMiddleMargin 10
//图片宽高
#define LSStatusBarHUDImageWidth 20


//图片旋转duration
#define LSStatusBarHUDImageDuration 0.1




#endif /* LSStatusBarHUDConst_h */
