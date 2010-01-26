//
//  CondoViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol CondoViewControllerDelegate;

@interface CondoViewController : UITableViewController {
	NSDictionary *condo;
	
	id <CondoViewControllerDelegate> delegate;
}

@property (nonatomic, retain) NSDictionary *condo;

@property (nonatomic, assign) id <CondoViewControllerDelegate> delegate;

@end

@protocol CondoViewControllerDelegate
- (void)condoViewControllerDidClose:(CondoViewController *)controller;
@end