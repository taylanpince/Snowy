//
//  PropertyViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"


@interface PropertyViewController : UITableViewController {
	Property *property;
}

@property (nonatomic, retain) Property *property;

@end