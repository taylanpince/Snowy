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

@synthesize name, image_path, image_on_path, properties, latitude, longitude;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.name = [dict objectForKey:@"name"];
		self.image_path = [dict objectForKey:@"image"];
		self.image_on_path = [dict objectForKey:@"image_on"];
		self.properties = [[NSMutableArray alloc] init];
		
		for (NSDictionary *propertyData in [dict objectForKey:@"properties"]) {
			Property *property = [[Property alloc] initWithDictionary:propertyData];
			
			[self.properties addObject:property];
			[property release];
		}
		
		self.latitude = [[dict objectForKey:@"latitude"] doubleValue];
		self.longitude = [[dict objectForKey:@"longitude"] doubleValue];
	}
	
	return self;
}

- (void)dealloc {
	[name release];
	[image_path release];
	[image_on_path release];
	[properties release];
	[super dealloc];
}

@end
