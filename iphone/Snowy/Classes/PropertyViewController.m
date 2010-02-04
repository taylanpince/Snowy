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
#import "SnowyAppDelegate.h"

#define cellIdentifier @"cell"


@interface PropertyViewController (PrivateMethods)
- (void)didTouchHomeButton:(id)sender;
@end


@implementation PropertyViewController

@synthesize properties, headerView, optionsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"Choose a Property"];
	[self.view setBackgroundColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
	
	headerView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0, 0.0, 312.0, 206.0)];
	
	[self.view addSubview:headerView];
	
	optionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(4.0, 206.0, 312.0, 212.0)];
	
	[optionsTableView setDelegate:self];
	[optionsTableView setDataSource:self];
	
	[self.view addSubview:optionsTableView];
	
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quadrant.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(didTouchHomeButton:)];
	
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[optionsTableView reloadData];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	
	[optionsTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
	
	if ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0) {
		[headerView setImage:[UIImage imageNamed:@"header.jpg"]];
	} else {
		Property *property = [properties objectAtIndex:0];
		
		[headerView setImage:[UIImage imageNamed:property.header_image_path]];
	}
}

- (void)didTouchHomeButton:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0) ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0 && section == 0) ? 1 : [properties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
		
		[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
	}
	
	if ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0 && indexPath.section == 0) {
		[cell.textLabel setText:[NSString stringWithFormat:@"My Floorplans (%d)", [[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count]]];
	} else {
		Property *property = [properties objectAtIndex:indexPath.row];
		
		[cell.textLabel setText:property.name];
	}

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40.0;
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0 && section == 0) ? @"Saved Floorplans" : @"Properties";
}*/

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([tableView indexPathForSelectedRow] != indexPath) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.75];
		[UIView	setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:headerView cache:YES];
		
		if ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0 && indexPath.section == 0) {
			[headerView setImage:[UIImage imageNamed:@"header.jpg"]];
		} else {
			Property *property = [properties objectAtIndex:indexPath.row];
			
			[headerView setImage:[UIImage imageNamed:property.header_image_path]];
		}

		[UIView commitAnimations];
	}
	
	return indexPath;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	FloorplansViewController *controller = [[FloorplansViewController alloc] init];
	
	if ([[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count] > 0 && indexPath.section == 0) {
		[controller setFloorplans:[[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] copy]];
	} else {
		Property *property = [properties objectAtIndex:indexPath.row];
		
		[controller setFloorplans:property.floorplans];
	}

	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

- (void)dealloc {
	[properties release];
	[headerView release];
	[optionsTableView release];
    [super dealloc];
}

@end