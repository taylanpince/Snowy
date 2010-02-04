    //
//  SplashViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-04.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "SplashViewController.h"


@implementation SplashViewController

- (void)loadView {
	UIImageView *splashView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	
	self.view = splashView;
	
	[splashView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}

@end