//
//  Property.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Location.h"


@interface Property : NSObject <MKAnnotation> {
	int number;
	
	NSString *name;
	NSString *header_image_path;
	NSMutableArray *floorplans;
	
	Location *location;
	
	double latitude;
	double longitude;
	
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic, assign) int number;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *header_image_path;
@property (nonatomic, retain) NSMutableArray *floorplans;

@property (nonatomic, retain) Location *location;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (id)initWithDictionary:(NSDictionary *)dict;

@end