//
//  PropertyViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface PropertyViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *properties;
	UIImageView *headerView;
}

@property (nonatomic, retain) NSArray *properties;
@property (nonatomic, retain) UIImageView *headerView;

@end