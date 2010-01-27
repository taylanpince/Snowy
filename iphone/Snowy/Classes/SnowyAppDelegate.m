//
//  SnowyAppDelegate.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "SnowyAppDelegate.h"
#import "RootViewController.h"


@implementation SnowyAppDelegate

@synthesize window, viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[window setBackgroundColor:[UIColor blackColor]];
	[window addSubview:[viewController view]];
	[window makeKeyAndVisible];
}

- (void)dealloc {
	[viewController release];
	[window release];
	[super dealloc];
}

@end