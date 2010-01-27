//
//  LocationViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Location.h"


@protocol LocationViewControllerDelegate;

@interface LocationViewController : UITableViewController {
	Location *location;
	
	id <LocationViewControllerDelegate> delegate;
}

@property (nonatomic, retain) Location *location;

@property (nonatomic, assign) id <LocationViewControllerDelegate> delegate;

@end

@protocol LocationViewControllerDelegate
- (void)locationViewControllerDidClose:(LocationViewController *)controller;
@end