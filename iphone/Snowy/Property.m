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

@synthesize name, image_path, header_image_path, floorplans;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.name = [dict objectForKey:@"name"];
		self.image_path	= [dict objectForKey:@"image"];
		self.header_image_path = [dict objectForKey:@"header_image"];
		self.floorplans = [[NSMutableArray alloc] init];
		
		for (NSDictionary *floorplanData in [dict objectForKey:@"floorplans"]) {
			Floorplan *floorplan = [[Floorplan alloc] initWithDictionary:floorplanData];
			
			[self.floorplans addObject:floorplan];
			[floorplan release];
		}
	}
	
	return self;
}

- (void)dealloc {
	[name release];
	[image_path release];
	[floorplans release];
	[super dealloc];
}

@end
