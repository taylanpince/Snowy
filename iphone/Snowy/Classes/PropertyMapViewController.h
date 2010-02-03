//
//  PropertyMapViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Location.h"


@interface PropertyMapViewController : UIViewController <MKMapViewDelegate> {
	Location *location;
}

@property (nonatomic, retain) Location *location;

@end