//
//  DDViewController.m
//  Dev-Denver
//
//  Created by 刘 明 on 12-11-9.
//  Copyright (c) 2012年 刘 明. All rights reserved.
//

#import "DDSpeakerViewController.h"

@interface DDSpeakerViewController ()
@property (nonatomic, strong) IBOutlet UILabel *organizationLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;;
@property (nonatomic, strong) IBOutlet UITextView *descriptionTextView;
@end

@implementation DDSpeakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set the name
	self.organizationLabel.text = self.organization;
	
    // set the nav bar title
	self.title = self.name;
	
    // set the image
	self.imageView.image = [UIImage imageNamed:self.imagePath];
	
    // set the description
	self.descriptionTextView.text = self.description;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
