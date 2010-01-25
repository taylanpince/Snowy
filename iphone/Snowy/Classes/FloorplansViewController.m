//
//  FloorplansViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplansViewController.h"


@implementation FloorplansViewController

- (void)loadView {
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	self.view = scrollView;
	
	[scrollView release];
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