//
//  DDAppDelegate.m
//  Dev-Denver
//
//  Created by 刘 明 on 12-11-9.
//  Copyright (c) 2012年 刘 明. All rights reserved.
//

#import "DDAppDelegate.h"

@implementation DDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// 在应用程序运行后定制化
	[application setStatusBarStyle:UIStatusBarStyleBlackOpaque];	// 状态条：黑色不透明
	
	[self customizeChrome];
	
    return YES;
}

- (void)customizeChrome
{
	// ============
	// = 导航条定制 =
	// ============
	// 定制导航条背景
	UIImage *navBarImage = [UIImage imageNamed:@"navbar.png"];
	[[UINavigationBar appearance] setBackgroundImage:navBarImage
                                       forBarMetrics:UIBarMetricsDefault];

	// 定制导航条“back”按钮
	UIImage *backButton = [[UIImage imageNamed:@"back-button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 4)];
	[[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
	// ============
	// = 导航条定制 =
	// ============
    
	
	// ============
	// = 标签条定制 =
	// ============
    // 定制标签条背景
	UIImage *tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
	[[UITabBar appearance] setBackgroundImage:tabBarBackground];
	
    // 定制标签条选择项图像
	[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar-item.png"]];
	
    // 定制标签条项标签颜色
    // 普通情况（文字颜色、文字阴影颜色、文字阴影偏移量）
	NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor colorWithRed:23.0/255.0 green:55.0/255.0 blue:55.0/255.0 alpha:1.0],
                                    UITextAttributeTextColor,
                                    [UIColor colorWithRed:52.0/255.0 green:132.0/255.0 blue:147.0/255.0 alpha:1.0],
                                    UITextAttributeTextShadowColor,
                                    [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
                                    UITextAttributeTextShadowOffset, nil];
	[[UITabBarItem appearance] setTitleTextAttributes:textAttributes
                                             forState:UIControlStateNormal];
    
    // 选择情况（文字颜色、文字阴影偏移量）
    NSDictionary *textAttributesSelected = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIColor whiteColor],
                                            UITextAttributeTextColor,
                                            [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                            UITextAttributeTextShadowOffset, nil];
	[[UITabBarItem appearance] setTitleTextAttributes:textAttributesSelected
                                             forState:UIControlStateSelected];
	
	// 获取一个标签条控制器，用来设置标签的图像和颜色。这是一个蹩脚的方式
	UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
	
	// 在标签条控制器里获取第一个视图控制器
	UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
	
	// 安装 speakers 标签图标
	UIImage *speakersIconNormal = [UIImage imageNamed:@"speakers-tab-bar-item.png"];
	UIImage *speakersIconSelected = [UIImage imageNamed:@"speakers-tab-bar-selected-item.png"];
	UITabBarItem *speakersItem = [[UITabBarItem alloc] initWithTitle:@"Speakers"
                                                               image:speakersIconNormal
                                                                 tag:0];
	[speakersItem setFinishedSelectedImage:speakersIconSelected
               withFinishedUnselectedImage:speakersIconNormal];
	// 当标签条控制器在视图控制器，设置标签条项
	[navigationController setTabBarItem:speakersItem];
	
	// 安装 sponsors 标签图标
	UIImage *sponsorsIconNormal = [UIImage imageNamed:@"sponsors-tab-bar-item.png"];
	UIImage *sponsorsIconSelected = [UIImage imageNamed:@"sponsors-tab-bar-selected-item.png"];
	UITabBarItem *sponsorsItem = [[UITabBarItem alloc] initWithTitle:@"Sponsors"
                                                               image:sponsorsIconNormal
                                                                 tag:1];
	[sponsorsItem setFinishedSelectedImage:sponsorsIconSelected
               withFinishedUnselectedImage:sponsorsIconNormal];	
	UIViewController *sponsorsController = [[tabBarController viewControllers] objectAtIndex:1];
	[sponsorsController setTabBarItem:sponsorsItem];
	// ============
	// = 标签条定制 =
	// ============
}

@end
