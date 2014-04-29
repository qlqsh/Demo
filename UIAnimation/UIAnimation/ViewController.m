//
//  ViewController.m
//  UIAnimation
//
//  Created by 刘明 on 14-4-24.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import "ViewController.h"

#ifndef ITEM_SPACING
#define ITEM_SPACING 200
#endif

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder])
	{
		_wrap = YES;
	}
	
	return self;
}

#pragma mark - view life

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	_carousel.delegate = self;
	_carousel.dataSource = self;
	
	_carousel.type = iCarouselTypeCoverFlow;
	_navItem.title = @"封面展示";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Action

- (IBAction)switchCarouselType
{
	UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择类型"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"直线", @"圆圈", @"反向圆圈", @"圆桶", @"反向圆桶", @"封面展示", @"封面展示2", @"纸牌", nil];
	[sheet showInView:self.view];
}

- (IBAction)toggleWrap
{
	_wrap = !_wrap;
	_navItem.rightBarButtonItem.title = _wrap ? @"边界:ON" : @"边界:OFF";
	[_carousel reloadData];
}

#pragma mark - UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	for (UIView *view in _carousel.visibleItemViews)
	{
		view.alpha = 1.0;
	}
	
	[UIView beginAnimations:nil context:nil];
	_carousel.type = buttonIndex;
	[UIView commitAnimations];
	
	_navItem.title = [actionSheet buttonTitleAtIndex:buttonIndex];
}

#pragma mark - iCarouselDataSource

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
	return 30;
}

- (UIView*)carousel:(iCarousel*)carousel
 viewForItemAtIndex:(NSUInteger)index
{
	UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", index]]];
	
	view.frame = CGRectMake(70, 80, 180, 260);
	return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
	return 30;
}

#pragma mark - iCarouselDelegate

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
	return ITEM_SPACING;
}

- (CATransform3D)carousel:(iCarousel*)carousel
     transformForItemView:(UIView*)view
               withOffset:(CGFloat)offset
{
	view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
	
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = self.carousel.perspective;
	transform = CATransform3DRotate(transform, M_PI/8.0, 0, 1.0, 0);
	
	return CATransform3DTranslate(transform, 0.0, 0.0, offset*carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
	return _wrap;
}

@end
