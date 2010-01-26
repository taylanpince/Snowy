//
//  FloorplansViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@interface FloorplansViewController : UIViewController <UIScrollViewDelegate> {
	NSMutableArray *floorplans;
	NSDictionary *condo;
	
	BOOL pageControlUsed;
}

@property (nonatomic, retain) NSMutableArray *floorplans;
@property (nonatomic, retain) NSDictionary *condo;

@end
