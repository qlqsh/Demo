//
//  ViewController.h
//  UIAnimation
//
//  Created by 刘明 on 14-4-24.
//  Copyright (c) 2014年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (nonatomic, strong) IBOutlet UINavigationItem *navItem;

@property (nonatomic, assign) BOOL wrap;

- (IBAction)switchCarouselType;
- (IBAction)toggleWrap;

@end
