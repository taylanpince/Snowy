//
//  CondoViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CondoViewController.h"
#import "FloorplansViewController.h"

#define cellIdentifier @"cell"


@interface CondoViewController (PrivateMethods)
- (void)goHome:(id)sender;
@end



@implementation CondoViewController

@synthesize condo, delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:[condo objectForKey:@"name"]];
	
	UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quadrant.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(goHome:)];
	
	[self.navigationItem setLeftBarButtonItem:homeButton];
	[homeButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)goHome:(id)sender {
	[delegate condoViewControllerDidClose:self];
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
		
		[cell.imageView.layer setCornerRadius:10.0];
		[cell.imageView.layer setMasksToBounds:YES];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}
	
	[cell setSelectionStyle:((indexPath.row > 0) ? UITableViewCellSelectionStyleBlue : UITableViewCellSelectionStyleNone)];
	
	switch (indexPath.row) {
		case 0: {
			[cell.imageView setImage:[UIImage imageNamed:[condo objectForKey:@"header_image"]]];
			break;
		}
		case 1: {
			[cell.textLabel setText:@"Floorplans"];
			break;
		}
		case 2: {
			[cell.textLabel setText:@"Budget Calculator"];
			break;
		}
		case 3: {
			[cell.textLabel setText:@"Choose a Rep"];
			break;
		}
		case 4: {
			[cell.textLabel setText:@"My Condo"];
			break;
		}
	}
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 0) {
		return 160.0;
	} else {
		return 40.0;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.row) {
		case 1: {
			FloorplansViewController *controller = [[FloorplansViewController alloc] init];
			
			[controller setCondo:condo];
			[self.navigationController pushViewController:controller animated:YES];
			[controller release];
			break;
		}
		case 2: {
			NSLog(@"LAUNCH CALCULATOR");
			break;
		}
		case 3: {
			NSLog(@"LAUNCH REP SELECTOR");
			break;
		}
		case 4: {
			NSLog(@"LAUNCH MY CONDO");
			break;
		}
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
	[condo release];
    [super dealloc];
}

@end