//
//  RootViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "Location.h"
#import "RootViewController.h"
#import "LocationViewController.h"
#import "PropertyViewController.h"
#import "PropertyMapViewController.h"
#import "SnowyAppDelegate.h"


@interface RootViewController (PrivateMethods)
- (void)didTapSettingsButton:(id)sender;
- (void)launchLocationView;
@end


@implementation RootViewController

- (void)loadView {
	HomeView *homeView = [[HomeView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	[homeView setDelegate:self];
	
	self.view = homeView;
	
	[homeView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"My Minto Condo"];
	
	UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gears.png"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapSettingsButton:)];
	
	[self.navigationItem setRightBarButtonItem:settingsButton];
	[settingsButton release];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	if ([prefs integerForKey:@"activeLocation"] == 0) {
		[self launchLocationView];
	}
	
	[(HomeView *)[self view] setFloorplanCount:[[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] savedFloorplans] count]];
}

- (void)launchLocationView {
	LocationViewController *controller = [[LocationViewController alloc] init];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
	
	[controller setDelegate:self];
	[controller setLocations:[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] locations]];
	[self presentModalViewController:navController animated:YES];
	
	[controller release];
	[navController release];
}

- (void)didTapSettingsButton:(id)sender {
	[self launchLocationView];
}

- (void)homeView:(HomeView *)homeView didSelectTab:(NSInteger)tabIndex {
	switch (tabIndex) {
		case 0: {
			NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
			Location *location = [[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] locations] objectAtIndex:[prefs integerForKey:@"activeLocation"] - 1];
			PropertyMapViewController *controller = [[PropertyMapViewController alloc] init];
			
			[controller setLocation:location];
			[self.navigationController pushViewController:controller animated:YES];
			[controller release];
			break;
		}
		case 1: {
			NSLog(@"FIND A REP");
			break;
		}
		case 2: {
			NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
			Location *location = [[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] locations] objectAtIndex:[prefs integerForKey:@"activeLocation"] - 1];
			PropertyViewController *controller = [[PropertyViewController alloc] init];
			
			[controller setProperties:location.properties];
			[self.navigationController pushViewController:controller animated:YES];
			[controller release];
			break;
		}
		case 3: {
			NSLog(@"CALCULATOR");
			break;
		}
		case 4: {
			NSLog(@"SHARE");
			break;
		}
		case 5: {
			NSLog(@"REVIEWS");
			break;
		}
		case 6: {
			NSLog(@"NEIGHBOURHOODS");
			break;
		}
		case 7: {
			NSLog(@"TIPS");
			break;
		}
	}
}

- (void)locationViewControllerDidClose:(LocationViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
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