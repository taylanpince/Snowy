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

@synthesize window;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end