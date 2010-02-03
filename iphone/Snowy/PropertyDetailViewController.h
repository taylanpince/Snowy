//
//  PropertyDetailViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-03.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"


@interface PropertyDetailViewController : UIViewController {
	Property *property;
}

@property (nonatomic, retain) Property *property;

@end
