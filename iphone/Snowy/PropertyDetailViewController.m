//
//  PropertyDetailViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-03.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplansViewController.h"
#import "PropertyDetailViewController.h"

#define cellIdentifier @"cell"


@implementation PropertyDetailViewController

@synthesize property, headerView, optionsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:property.name];
	[self.view setBackgroundColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
	
	headerView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0, 0.0, 312.0, 206.0)];
	
	[headerView setImage:[UIImage imageNamed:property.header_image_path]];
	[self.view addSubview:headerView];
	
	optionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(4.0, 206.0, 312.0, 212.0)];
	
	[optionsTableView setDelegate:self];
	[optionsTableView setDataSource:self];
	
	[self.view addSubview:optionsTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
		
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
	
	switch (indexPath.row) {
		case 0: {
			[cell.textLabel setText:@"Collections"];
			break;
		}
		case 1: {
			[cell.textLabel setText:@"Amenities"];
			break;
		}
		case 2: {
			[cell.textLabel setText:@"Floorplans"];
			break;
		}
		case 3: {
			[cell.textLabel setText:@"Photos"];
			break;
		}
		case 4: {
			[cell.textLabel setText:@"Neighbourhood"];
			break;
		}
	}
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.row) {
		case 2: {
			FloorplansViewController *controller = [[FloorplansViewController alloc] init];
			
			[controller setFloorplans:property.floorplans];
			[self.navigationController pushViewController:controller animated:YES];
			[controller release];
			break;
		}
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
	[property release];
	[headerView release];
	[optionsTableView release];
    [super dealloc];
}

@end