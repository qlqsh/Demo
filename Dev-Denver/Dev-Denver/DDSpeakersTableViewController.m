//
//  DDSpeakersTableViewController.m
//  Dev-Denver
//
//  Created by 刘 明 on 12-11-10.
//  Copyright (c) 2012年 刘 明. All rights reserved.
//

#import "DDSpeakersTableViewController.h"
#import "DDSpeakerViewController.h"

@interface DDSpeakersTableViewController ()
@property (nonatomic, strong) NSArray *speakers;
@end

@implementation DDSpeakersTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // UITableView 数据源
	_speakers = [NSArray arrayWithObjects:
		[NSDictionary dictionaryWithObjectsAndKeys:
			@"Drew Dahlman", @"name",
			@"Drew divides his time between designing and developing. He is a jack of all trades and as you can see bears an uncanny likeness to a famous actor... Rodney Dangerfield.", @"description",
			@"Develop Denver", @"organization",
			@"drew-thumb.png", @"thumb",
			@"drew.jpg", @"image", nil],
		[NSDictionary dictionaryWithObjectsAndKeys:
			@"Pete Larson", @"name",
			@"94cb18183f2b1b15400490dff2d167b8660f7861quot;When he is not making and eating peanutbutter sandwiches, Pete Larson divides his time between drinking heavliy (pictured) and occasionally coding.94cb18183f2b1b15400490dff2d167b8660f7861quot; -Eric Wedum", @"description",
			@"Jiffy Media", @"organization",
			@"pete-thumb.png", @"thumb",
			@"pete.jpg", @"image", nil],
		[NSDictionary dictionaryWithObjectsAndKeys:
			@"Sean Dougherty", @"name",
			@"As a former art major, Sean Doughery understands the importance of visual impact. Check out the guns ladies, LOOK but don't touch, he is spoken for (sorry).", @"description",
			@"process255", @"organization",
			@"sean-thumb.png", @"thumb",
			@"sean.jpg", @"image", nil],
		[NSDictionary dictionaryWithObjectsAndKeys:
			@"Sean & Matt", @"name",
			@"These dudes work it with their legs.", @"description",
			@"Legwork", @"organization",
			@"sean-matt-thumb.png", @"thumb",
			@"sean-matt.jpg", @"image", nil],
		nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// return the number of sections our table should contain
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// return the number of rows our table should contain
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_speakers count];
}

// return the height of table cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 93;
}

// called when a new table cell is created
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// =========================================
	// = 从队列中获取一个已存在的Cell，没有就建立一个 =
	// =========================================
    static NSString *CellIdentifier = @"SpeakerCell";
    
    // grab a gueued cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // create a new cell if one is not in the gueue
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
	}
	// =========================================
	// = 从队列中获取一个已存在的Cell，没有就建立一个 =
	// =========================================
	
	
	// =====================
	// = 定制Cell，图像＋文字 =
	// =====================
    // grab the speaker dictionary
	NSDictionary *speaker = [_speakers objectAtIndex:indexPath.row];
	
    // grab a reference to the thumbnail image view in the cell
	UIImageView *thumb = (UIImageView *)[cell viewWithTag:1];
	
    // set the thumbnail imageview's image in cell's image
	thumb.image = [UIImage imageNamed:[speaker objectForKey:@"thumb"]];
	
    // grab a reference to the name label in the cell
	UILabel *nameLabel = (UILabel *)[cell viewWithTag:2];
	
    // set the name in the cell's name label
	nameLabel.text = [speaker objectForKey:@"name"];
	// =====================
	// = 定制Cell，图像＋文字 =
	// =====================
    
	
    return cell;
}


/*
 * 新视图定制化，当表格单元被选择后。
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 确认提交正确的segue
	if ([[segue identifier] isEqualToString:@"ShowSpeaker"])
	{
		// 获取目标视图控制器
		DDSpeakerViewController *vc = [segue destinationViewController];
		
        // 获取选择索引
		NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
		
		// 抓取speaker字典
		NSDictionary *speaker = [_speakers objectAtIndex:selectedIndex];
		
        // Pass the name to our view controller
		vc.name = [speaker objectForKey:@"name"];
		
        // Pass the description to our view controller
		vc.description = [speaker objectForKey:@"description"];
		
        // Pass the imagePath to our view controller
		vc.imagePath = [speaker objectForKey:@"image"];
		
        // Pass the organizagtion to our view controller
		vc.organization = [speaker objectForKey:@"organization"];
	}	
}

@end
