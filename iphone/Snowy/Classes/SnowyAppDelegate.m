//
//  SnowyAppDelegate.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "SnowyAppDelegate.h"


@implementation SnowyAppDelegate

@synthesize window, navController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	UIColor *mintoBlueColor = [UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0];
	
	[navController.navigationBar setTintColor:mintoBlueColor];
	[window setBackgroundColor:mintoBlueColor];
	[window addSubview:[navController view]];
	[window makeKeyAndVisible];
}

- (void)dealloc {
	[navController release];
	[window release];
	[super dealloc];
}

@end