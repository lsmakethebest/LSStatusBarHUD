# LSStatusBarHUD
##一个类似映客，qq音乐，新版qq状态栏上的提示效果


#使用方法

##映客效果使用方法

	- (IBAction)yktip:(id)sender
    {
    	[LSStatusBarHUD showMessage:@"正在努力加载数据..."];
    }
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/inlike.PNG)
    
##qq音乐无网效果使用方法
	- (IBAction)error:(id)sender 
	{
     [LSStatusBarHUD showMessageAndImage:@"播放错误"];
	}

![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/error.PNG)	
##qq音乐加载使用方法
	- (IBAction)loading:(id)sender {
    [LSStatusBarHUD showLoading:@"正在努力加载数据..."];
    }

![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/loading.PNG)
##隐藏加载提示窗使用方法
	- (IBAction)hideLoading:(id)sender 
	{
    	[LSStatusBarHUD hideLoading];    
	}
	
	
#如果自己的软件有自己的统一风格最好自定义个类，然后在类方法里实现自己的风格这样每次自己调用的时候就可以非常方便
##自定义映客显示效果	 
###这里自定义类CustomHUD 
	+(void)showMessage:(NSString *)message
	{
    
    NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:message color:	[UIColor redColor] font:[UIFont systemFontOfSize:20]];    
    [LSStatusBarHUD showMessage:a backgroundColor:[UIColor colorWithRed:0/255.0 green:121/255.0 blue:195/255.0 alpha:1]];
	}
##自定义qq音乐加载效果
	+(void)showLoading:(NSString *)loading
	{
    	NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:loading color:[UIColor blueColor] font:[UIFont systemFontOfSize:20]];
    NSMutableArray *images=[NSMutableArray array];
    	for (int i=1; i<=12; i++) 
    	{
      	  [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]]];
      	  	 }
    	[LSStatusBarHUD showLoading:a images:images backgroundColor:[UIColor yellowColor]];
	}

##自定义映客效果使用方法
	- (IBAction)customTip:(id)sender {
    	[CustomHUD showMessage:@"哈哈哈哈哈哈哈哈"];
	}
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/customInlike.PNG)
##自定义加载效果使用方法
	- (IBAction)customLoading:(id)sender {
       [CustomHUD showLoading:@"正在疯狂加载中..."];
	}
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/customLoading.PNG)

