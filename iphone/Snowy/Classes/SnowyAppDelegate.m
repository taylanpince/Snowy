//
//  SnowyAppDelegate.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "Location.h"
#import "SnowyAppDelegate.h"


@implementation SnowyAppDelegate

@synthesize window, navController, locations, savedFloorplans;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	UIColor *mintoBlueColor = [UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0];
	
	[navController.navigationBar setTintColor:mintoBlueColor];
	[window setBackgroundColor:mintoBlueColor];
	[window addSubview:[navController view]];
	[window makeKeyAndVisible];
}

- (NSArray *)locations {
	if (locations != nil) {
		return locations;
	}
	
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
	
	self.locations = [[NSArray alloc] initWithArray:locationsList];
	
	[locationsList release];
	
	return locations;
}

- (NSMutableArray *)savedFloorplans {
	if (savedFloorplans != nil) {
		return savedFloorplans;
	}
	
	self.savedFloorplans = [[NSMutableArray alloc] init];
	
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	if ([prefs objectForKey:@"savedFloorplans"] != nil) {
		NSMutableArray *availableFloorplans = [[NSMutableArray alloc] init];
		
		for (Location *location in [self locations]) {
			[availableFloorplans addObjectsFromArray:[location allFloorplans]];
		}
		
		for (NSDictionary *floorplan in [prefs objectForKey:@"savedFloorplans"]) {
			NSPredicate *predicate = [NSPredicate predicateWithFormat:@"number = %d AND property.number = %d AND property.location.number = %d", 
				[[floorplan objectForKey:@"floorplan"] intValue],
				[[floorplan objectForKey:@"property"] intValue],
				[[floorplan objectForKey:@"location"] intValue]
			];
			
			NSArray *filteredArray = [availableFloorplans filteredArrayUsingPredicate:predicate];
			
			if ([filteredArray count] > 0) {
				[savedFloorplans addObject:[filteredArray objectAtIndex:0]];
			}
		}
		
		[availableFloorplans release];
	}
	
	return savedFloorplans;
}

- (void)saveFloorplan:(Floorplan *)floorplan {
	[savedFloorplans addObject:floorplan];
}

- (void)removeFloorplan:(Floorplan *)floorplan {
	[savedFloorplans removeObject:floorplan];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)dealloc {
	[locations release];
	[savedFloorplans release];
	[navController release];
	[window release];
	[super dealloc];
}

@end