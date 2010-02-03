//
//  PropertyDetailViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-03.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "PropertyDetailViewController.h"


@implementation PropertyDetailViewController

@synthesize property;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:property.name];
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