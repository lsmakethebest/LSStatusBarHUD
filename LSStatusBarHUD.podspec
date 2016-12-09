Pod::Spec.new do |s|
s.name         = 'LSStatusBarHUD'
s.version      = '1.0.0'
s.summary      = '一个类似映客，qq音乐，新版qq状态栏上的提示效果-可以按自己的需求自定义样式'
s.homepage     = 'https://github.com/lsmakethebest/LSStatusBarHUD'
s.license      = 'MIT'
s.authors      = {'ls' => '623501561@qq.com'}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/lsmakethebest/LSStatusBarHUD.git', :tag => s.version}
#社交网址,这里我写的微博默认是Twitter,如果你写Twitter的话,你的podspec发布成功后会@你
s.social_media_url   = "http://weibo.com/itiapp"
s.source_files = 'LSStatusBarHUD/**/*.{h,m}'
s.resource     = 'LSStatusBarHUD/LSStatusBarHUD.bundle'#资源文件
s.requires_arc = true

#s.frameworks = 'UIKit', 'QuartzCore', 'Foundation'    #所需的framework,多个用逗号隔开


#s.dependency "SDWebImage"
# s.dependency "JSONKit", "~> 1.4"	#依赖关系，该项目所依赖的其他库，如果有多个可以写多个 s.dependency

end
