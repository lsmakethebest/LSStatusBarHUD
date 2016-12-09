# LSStatusBarHUD
##一个类似映客，qq音乐，新版qq状态栏上的提示效果-可以按自己的需求自定义样式
<br/>
##集成方法
###1.手动下载
###2.pod 'LSStatusBarHUD'

 <br/>
##注意点
####1.下面方法显示完会自动隐藏
    showMessageAndImage
    showMessage
####2.下面方法不会自动隐藏
    showLoading
####3.但是不管哪种样式连续显示多个都会把之前的隐藏，也就是说界面上只会显示最后创建的一个，这样也是为了防止用户快速连续点击
 <br/>
 <br/>   

#使用方法

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
##qq音乐无网效果使用方法
	- (IBAction)error:(id)sender 
	{
     [LSStatusBarHUD showMessageAndImage:@"播放错误"];
	}
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/error.PNG)
##新版qq样式使用方法
	- (IBAction)qq:(id)sender {
	    NSMutableAttributedString *a= [LSStatusBarHUD createAttributedText:@"已发送" color:[UIColor blackColor] font:[UIFont systemFontOfSize:16]];
	 [LSStatusBarHUD showMessageAndImage:a image:[UIImage imageNamed:@"success.png"] backgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
	}
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/qq.PNG)	
##映客效果使用方法

	- (IBAction)yktip:(id)sender
    {
    	[LSStatusBarHUD showMessage:@"正在努力加载数据..."];
    }
![image](https://github.com/lsmakethebest/LSStatusBarHUD/blob/master/images/inlike.PNG)
    

	

	
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

