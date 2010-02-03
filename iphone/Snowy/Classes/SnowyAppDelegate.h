//
//  SnowyAppDelegate.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "Floorplan.h"


@interface SnowyAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *navController;
	
	NSArray *locations;
	NSMutableArray *savedFloorplans;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@property (nonatomic, retain) NSArray *locations;
@property (nonatomic, retain) NSMutableArray *savedFloorplans;

- (void)saveFloorplan:(Floorplan *)floorplan;
- (void)removeFloorplan:(Floorplan *)floorplan;

@end

