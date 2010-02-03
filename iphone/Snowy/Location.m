//
//  Location.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Location.h"
#import "Property.h"


@implementation Location

@synthesize number, name, image_path, image_on_path, properties, latitude, longitude;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.number = [[dict objectForKey:@"id"] intValue];
		self.name = [dict objectForKey:@"name"];
		self.image_path = [dict objectForKey:@"image"];
		self.image_on_path = [dict objectForKey:@"image_on"];
		self.properties = [[NSMutableArray alloc] init];
		
		for (NSDictionary *propertyData in [dict objectForKey:@"properties"]) {
			Property *property = [[Property alloc] initWithDictionary:propertyData];
			
			[property setLocation:self];
			[self.properties addObject:property];
			[property release];
		}
		
		self.latitude = [[dict objectForKey:@"latitude"] doubleValue];
		self.longitude = [[dict objectForKey:@"longitude"] doubleValue];
	}
	
	return self;
}

- (NSArray *)allFloorplans {
	NSMutableArray *floorplans = [NSMutableArray array];
	
	for (Property *property in properties) {
		[floorplans addObjectsFromArray:property.floorplans];
	}
	
	return [NSArray arrayWithArray:floorplans];
}

- (void)dealloc {
	[name release];
	[image_path release];
	[image_on_path release];
	[properties release];
	[super dealloc];
}

@end
