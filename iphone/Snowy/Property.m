//
//  Property.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "Floorplan.h"


@implementation Property

@synthesize name, header_image_path, floorplans, latitude, longitude;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.name = [dict objectForKey:@"name"];
		self.header_image_path = [dict objectForKey:@"header_image"];
		self.floorplans = [[NSMutableArray alloc] init];
		
		for (NSDictionary *floorplanData in [dict objectForKey:@"floorplans"]) {
			Floorplan *floorplan = [[Floorplan alloc] initWithDictionary:floorplanData];
			
			[self.floorplans addObject:floorplan];
			[floorplan release];
		}
		
		self.latitude = [[dict objectForKey:@"latitude"] doubleValue];
		self.longitude = [[dict objectForKey:@"longitude"] doubleValue];
	}
	
	return self;
}

- (CLLocationCoordinate2D)coordinate {
	CLLocationCoordinate2D location;
	
	location.latitude = self.latitude;
	location.longitude = self.longitude;
	
	return location;
}

- (NSString *)title {
	return self.name;
}

- (NSString *)subtitle {
	return self.name;
}

- (void)dealloc {
	[name release];
	[header_image_path release];
	[floorplans release];
	[super dealloc];
}

@end
