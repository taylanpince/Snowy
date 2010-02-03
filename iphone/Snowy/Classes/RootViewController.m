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


@interface RootViewController (PrivateMethods)
- (void)didTapSettingsButton:(id)sender;
- (void)launchLocationView;
@end


@implementation RootViewController

@synthesize locations;

- (void)loadView {
	HomeView *homeView = [[HomeView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	[homeView setDelegate:self];
	
	self.view = homeView;
	
	[homeView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setTitle:@"My Minto Condo"];
	
	NSString *error;
	NSPropertyListFormat format;
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Condominiums" ofType:@"plist"];
	NSData *data = [[NSData alloc] initWithContentsOfFile:path];
	NSArray *locationsData = (NSArray *)[NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
	
	if (!locationsData) {
		NSLog(@"ERROR READING PLIST: %@ (%@)", [path UTF8String], [error UTF8String]);
	}
	
	[error release];
	[data release];
	
	NSMutableArray *locationsList = [[NSMutableArray alloc] init];
	
	for (NSDictionary *locationData in locationsData) {
		Location *location = [[Location alloc] initWithDictionary:locationData];
		
		[locationsList addObject:location];
		[location release];
	}
	
	locations = [[NSArray alloc] initWithArray:locationsList];
	
	[locationsList release];
	
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
}

- (void)launchLocationView {
	LocationViewController *controller = [[LocationViewController alloc] init];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
	
	[controller setDelegate:self];
	[controller setLocations:locations];
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
			NSLog(@"PROPERTIES");
			break;
		}
		case 1: {
			NSLog(@"FIND A REP");
			break;
		}
		case 2: {
			NSLog(@"FLOORPLANS");
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
	[locations release];
    [super dealloc];
}

@end