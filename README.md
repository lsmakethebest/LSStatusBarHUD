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

