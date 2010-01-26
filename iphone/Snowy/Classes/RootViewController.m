//
//  RootViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "HomeView.h"
#import "RootViewController.h"
#import "CondoViewController.h"


@implementation RootViewController

@synthesize condos;

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
	
	condos = [(NSArray *)[NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error] retain];
	
	if (!condos) {
		NSLog(@"ERROR READING PLIST: %@ (%@)", [path UTF8String], [error UTF8String]);
	}
	
	[error release];
	[data release];
	
	[(HomeView *)[self view] setCondos:condos];
}

- (void)homeView:(HomeView *)homeView didSelectTab:(NSInteger)tabIndex {
	CondoViewController *controller = [[CondoViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
	
	[controller setCondo:[condos objectAtIndex:tabIndex]];
	[navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
	[self presentModalViewController:navController animated:YES];
	
	[controller release];
	[navController release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
}

- (void)dealloc {
	[condos release];
    [super dealloc];
}

@end