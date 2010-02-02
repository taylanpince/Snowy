//
//  LocationViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "LocationViewController.h"


@implementation LocationViewController

@synthesize locations, delegate;

- (void)loadView {
	LocationView *locationView = [[LocationView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	[locationView setDelegate:self];
	
	self.view = locationView;
	
	[locationView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"I'm looking for..."];
	[self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
	
	[(LocationView *)[self view] setLocations:locations];
}

- (void)locationView:(LocationView *)locationView didSelectTab:(int)tabIndex {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	[prefs setInteger:(tabIndex + 1) forKey:@"activeLocation"];
	
	[delegate locationViewControllerDidClose:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)dealloc {
	[locations release];
    [super dealloc];
}

@end