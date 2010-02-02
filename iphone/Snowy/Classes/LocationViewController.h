//
//  LocationViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "LocationView.h"


@protocol LocationViewControllerDelegate;

@interface LocationViewController : UIViewController <LocationViewDelegate> {
	NSArray *locations;
	
	id <LocationViewControllerDelegate> delegate;
}

@property (nonatomic, retain) NSArray *locations;

@property (nonatomic, assign) id <LocationViewControllerDelegate> delegate;

@end

@protocol LocationViewControllerDelegate
- (void)locationViewControllerDidClose:(LocationViewController *)controller;
@end