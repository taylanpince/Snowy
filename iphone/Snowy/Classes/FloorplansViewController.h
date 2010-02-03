//
//  FloorplansViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplanView.h"
#import "VirtualTourView.h"


@interface FloorplansViewController : UIViewController <UIScrollViewDelegate, FloorplanViewDelegate, VirtualTourViewDelegate> {
	NSArray *floorplans;
	NSMutableArray *floorplanViews;
	
	BOOL pageControlUsed;
	BOOL inVirtualTour;
}

@property (nonatomic, retain) NSArray *floorplans;
@property (nonatomic, retain) NSMutableArray *floorplanViews;

@end
