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
	UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	self.view = mainView;
	
	[mainView release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height - 20.0)];
	
	[self.view addSubview:scrollView];
	[scrollView release];
	
	UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - 20.0, self.view.frame.size.width, 20.0)];
	
	[self.view addSubview:pageControl];
	[pageControl release];
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