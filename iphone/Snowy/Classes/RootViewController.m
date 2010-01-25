//
//  RootViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "HomeView.h"
#import "RootViewController.h"


@implementation RootViewController

- (void)loadView {
	HomeView *homeView = [[HomeView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	[homeView setDelegate:self];
	
	self.view = homeView;
	
	[homeView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"minto"];
}

- (void)homeView:(HomeView *)homeView didSelectTab:(NSInteger)tabIndex {
	switch (tabIndex) {
		case 0:
			NSLog(@"FLOORPLANS");
			break;
		case 1:
			NSLog(@"CALCULATOR");
			break;
		case 2:
			NSLog(@"APPOINTMENTS");
			break;
		case 3:
			NSLog(@"MY CONDO");
			break;
		default:
			break;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)dealloc {
    [super dealloc];
}

@end