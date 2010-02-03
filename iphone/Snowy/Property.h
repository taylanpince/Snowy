//
//  Property.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import <MapKit/MapKit.h>


@interface Property : NSObject <MKAnnotation> {
	NSString *name;
	NSString *header_image_path;
	NSMutableArray *floorplans;
	
	double latitude;
	double longitude;
	
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *header_image_path;
@property (nonatomic, retain) NSMutableArray *floorplans;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (id)initWithDictionary:(NSDictionary *)dict;

@end