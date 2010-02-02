//
//  RootViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "HomeView.h"
#import "Location.h"
#import "RootViewController.h"
#import "LocationViewController.h"


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
	
	NSString *error;
	NSPropertyListFormat format;
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Condominiums" ofType:@"plist"];
	NSData *data = [[NSData alloc] initWithContentsOfFile:path];
	NSArray *locationsList = (NSArray *)[NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
	
	if (!locationsList) {
		NSLog(@"ERROR READING PLIST: %@ (%@)", [path UTF8String], [error UTF8String]);
	}
	
	[error release];
	[data release];
	
	locations = [[NSMutableArray alloc] init];
	
	for (NSDictionary *locationData in locationsList) {
		Location *location = [[Location alloc] initWithDictionary:locationData];
		
		[locations addObject:location];
		[location release];
	}
	
	[(HomeView *)[self view] setLocations:locations];
}

- (void)homeView:(HomeView *)homeView didSelectTab:(NSInteger)tabIndex {
	LocationViewController *controller = [[LocationViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
	
	[controller setDelegate:self];
	[controller setLocation:[locations objectAtIndex:tabIndex]];
	[navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
	[self presentModalViewController:navController animated:YES];
	
	[controller release];
	[navController release];
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