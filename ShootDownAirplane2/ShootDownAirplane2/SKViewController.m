//
//  SKViewController.m
//  ShootDownAirplane2
//
//  Created by 刘明 on 14-4-15.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import "SKViewController.h"
#import "SKMainScene.h"

#import <QuartzCore/QuartzCore.h>

@interface SKViewController ()

@end

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    SKView *skView = (SKView *)self.view;
    
	// 场景添加到视图
	SKScene *scene = [SKMainScene sceneWithSize:skView.bounds.size];
	scene.scaleMode = SKSceneScaleModeAspectFill;
	[skView presentScene:scene];
	
	// 暂停按钮
	UIImage *image = [UIImage imageNamed:@"BurstAircraftPause"];
	UIButton *button = [UIButton new];
	[button setFrame:CGRectMake(10, 25, image.size.width, image.size.height)];
	[button setBackgroundImage:image forState:UIControlStateNormal];
	[button addTarget:self
               action:@selector(pause)
     forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(gameOver)
                                                 name:@"gameOverNotification"
                                               object:nil];
}

#pragma mark - 游戏结束处理
/**
 *  布局一个游戏结束视图。包括1个按钮（重新开始）
 */
- (void)gameOver
{
	UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
	
    // =================================
	// = “重新开始”按钮（内容、样式、行为） =
	// =================================
	UIButton *button = [UIButton new];
    // 内容
	[button setBounds:CGRectMake(0, 0, 200, 30)];
	[button setCenter:backgroundView.center];
	[button setTitle:@"重新开始" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 样式
	[button.layer setBorderWidth:2.0];
	[button.layer setCornerRadius:15.0];
	[button.layer setBorderColor:[[UIColor grayColor] CGColor]];
    // 行为
	[button addTarget:self
               action:@selector(restart:)
     forControlEvents:UIControlEventTouchUpInside];
	
    [backgroundView addSubview:button];
    [backgroundView setCenter:self.view.center];
	
	[self.view addSubview:backgroundView];
}

/**
 *  重新开始游戏。
 *
 *  @param button 点击的按钮
 */
- (void)restart:(UIButton *)button
{
	[button.superview removeFromSuperview];
	((SKView *)self.view).paused = NO;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"restartNotification"
                                                        object:nil];
}

#pragma mark - 游戏暂停处理
/**
 *  布局一个暂停视图。包括2个按钮（继续、重新开始）
 */
- (void)pause
{
	((SKView *)self.view).paused = YES;
	
	UIView *pauseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
	
	// =============================
	// = “继续”按钮（内容、样式、行为） =
	// =============================
	UIButton *continueButton = [UIButton new];
    // 内容
	[continueButton setFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-100, 50, 200, 30)];
	[continueButton setTitle:@"继续" forState:UIControlStateNormal];
	[continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 样式
	[continueButton.layer setBorderWidth:2.0];
	[continueButton.layer setCornerRadius:15.0];
	[continueButton.layer setBorderColor:[[UIColor grayColor] CGColor]];
    // 行为
	[continueButton addTarget:self
                       action:@selector(continueGame:)
             forControlEvents:UIControlEventTouchUpInside];
    
	[pauseView addSubview:continueButton];
	
    // =================================
	// = “重新开始”按钮（内容、样式、行为） =
	// =================================
	UIButton *restartButton = [UIButton new];
    // 内容
	[restartButton setFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-100, 100, 200, 30)];
	[restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
	[restartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 样式
    [restartButton.layer setBorderWidth:2.0];
	[restartButton.layer setCornerRadius:15.0];
	[restartButton.layer setBorderColor:[[UIColor grayColor] CGColor]];
    // 行为
    [restartButton addTarget:self
                      action:@selector(restart:)
            forControlEvents:UIControlEventTouchUpInside];
	
    [pauseView addSubview:restartButton];
	pauseView.center = self.view.center;
	    
	[self.view addSubview:pauseView];
}

/**
 *  继续游戏
 *
 *  @param button 点击的按钮
 */
- (void)continueGame:(UIButton *)button
{
	[button.superview removeFromSuperview];
	((SKView *)self.view).paused = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
