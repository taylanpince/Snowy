//
//  FloorplansViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "FloorplanView.h"
#import "VirtualTourView.h"


@interface FloorplansViewController : UIViewController <UIScrollViewDelegate, FloorplanViewDelegate, VirtualTourViewDelegate> {
	Property *property;
	
	NSMutableArray *floorplans;
	
	BOOL pageControlUsed;
	BOOL inVirtualTour;
}

@property (nonatomic, retain) Property *property;

@property (nonatomic, retain) NSMutableArray *floorplans;

@end
