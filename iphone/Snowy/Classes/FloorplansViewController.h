//
//  FloorplansViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"


@interface FloorplansViewController : UIViewController <UIScrollViewDelegate> {
	Property *property;
	
	NSMutableArray *floorplans;
	
	BOOL pageControlUsed;
}

@property (nonatomic, retain) Property *property;

@property (nonatomic, retain) NSMutableArray *floorplans;

@end
