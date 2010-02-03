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

@synthesize number, name, address, header_image_path, floorplans, latitude, longitude, location;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.number = [[dict objectForKey:@"id"] intValue];
		self.name = [dict objectForKey:@"name"];
		self.address = [dict objectForKey:@"address"];
		self.header_image_path = [dict objectForKey:@"header_image"];
		self.floorplans = [[NSMutableArray alloc] init];
		
		for (NSDictionary *floorplanData in [dict objectForKey:@"floorplans"]) {
			Floorplan *floorplan = [[Floorplan alloc] initWithDictionary:floorplanData];
			
			[floorplan setProperty:self];
			[self.floorplans addObject:floorplan];
			[floorplan release];
		}
		
		self.latitude = [[dict objectForKey:@"latitude"] doubleValue];
		self.longitude = [[dict objectForKey:@"longitude"] doubleValue];
	}
	
	return self;
}

- (CLLocationCoordinate2D)coordinate {
	CLLocationCoordinate2D locationCoordinate;
	
	locationCoordinate.latitude = self.latitude;
	locationCoordinate.longitude = self.longitude;
	
	return locationCoordinate;
}

- (NSString *)title {
	return self.name;
}

- (NSString *)subtitle {
	return self.address;
}

- (void)dealloc {
	[name release];
	[address release];
	[header_image_path release];
	[floorplans release];
	[location release];
	[super dealloc];
}

@end
