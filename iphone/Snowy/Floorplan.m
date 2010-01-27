//
//  Floorplan.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Floorplan.h"


@implementation Floorplan

@synthesize image_path;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.image_path = [dict objectForKey:@"image"];
	}
	
	return self;
}

- (void)dealloc {
	[image_path release];
	[super dealloc];
}

@end
