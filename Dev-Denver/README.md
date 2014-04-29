# Dev-Denver总结

原帖：<https://github.com/process255/Dev-Denver/wiki/iOS-Designs-to-iPhone>

## 代码部分

### UIViewController
方法                 		|	功能描述
---------------------------	|	---------------------------
prepareForSegue:sender: 	|	通知，segue是要执行的视图控制器
setTabBarItem:			 	|	标签条项目描述，并添加到标签条控制器

### UIStoryboardSegue
方法								|	功能描述
----------------				|	----------------
destinationViewController		|	segue的目标视图控制器

### UIAppearance
方法				|	功能描述
-----------		|	-----------
appearance		|	指定外观代理

### UINavigationBar
方法									|	功能描述
-----------------					|	-----------------
setBackgroundImage:forBarMetrics:	|	设置背景、方向
UIBarMetricsDefault					|	默认，纵向
UIBarMetricsLandscapePhone			|	横向

### UIBarButtonItem
方法													|	功能描述
---------------------								|	---------------------
resizableImageWithCapInsets:						|	调整图像用指定上限
UIEdgeInsetsMake(top, left, bottom, right) 			|	定义视图嵌入位距
setBackButtonBackgroundImage:forState:barMetrics:	|	设置回退按钮背景图像、状态、方向
UIControlStateNormal		|	普通
UIControlStateHighlighted	|	高亮
UIControlStateDisabled		|	无效
UIControlStateSelected		|	选择的
UIControlStateApplication	|	为应用程序使用额外控制状态标志
UIControlStateReserved		|	为内部结构使用控制状态标志

### UITabBar
方法							|	功能描述
---------------				|	---------------
setBackgroundImage:			|	背景
setSelectionIndicatorImage:	|	“选择” 图像

### UIBarItem
方法									|	功能描述
-----------							|	-----------
setTitleTextAttributes:forState:	|	标题的文字属性和状态

### UITabBarItem
方法														|	功能描述
-------------											|	-------------
initWithTitle:image:tag:								|	指定属性的新项目
setFinishedSelectedImage:withFinishedUnselectedImage:	|	设置选择图像、不选择图像

### UIApplication
方法									|	功能描述
-----------------					|	-----------------
setStatusBarStyle:					|	状态条样式
UIStatusBarStyleDefault 			|	默认
UIStatusBarStyleBlackTranslucent	|	黑色半透明
UIStatusBarStyleBlackOpague			|	黑色不透明

## 界面部分

### Storyboard主要设置
* Tab Bar Controller -> Navigation Controller -> 1 Table View Controller -> 1.1 View Controller
* Tab Bar Controller -> Navigation Controller -> 2 View Controller
* 1 : DDSpeakersTableViewController
* 1.1 : DDSpeakerViewController
* Table View Cell : SpeakerCell
* Table View Cell -> (segue)push : ShowSpeaker