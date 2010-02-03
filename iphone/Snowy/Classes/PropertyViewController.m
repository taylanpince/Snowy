//
//  PropertyViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "PropertyViewController.h"
#import "FloorplansViewController.h"

#define cellIdentifier @"cell"


@implementation PropertyViewController

@synthesize properties, headerView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"Choose a Property"];
	[self.view setBackgroundColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
	
	headerView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0, 0.0, 312.0, 206.0)];
	
	[headerView setImage:[UIImage imageNamed:@"header.jpg"]];
	[self.view addSubview:headerView];
	
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(4.0, 206.0, 312.0, 212.0)];
	
	[tableView setDelegate:self];
	[tableView setDataSource:self];
	
	[self.view addSubview:tableView];
	[tableView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [properties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
		
		[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
	}
	
	Property *property = [properties objectAtIndex:indexPath.row];
	
	[cell.textLabel setText:property.name];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Property *property = [properties objectAtIndex:indexPath.row];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
	[UIView	setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:headerView cache:YES];
	
	[headerView setImage:[UIImage imageNamed:property.header_image_path]];
	
	[UIView commitAnimations];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	Property *property = [properties objectAtIndex:indexPath.row];
	
	FloorplansViewController *controller = [[FloorplansViewController alloc] init];
	
	[controller setProperty:property];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

- (void)dealloc {
	[properties release];
	[headerView release];
    [super dealloc];
}

@end