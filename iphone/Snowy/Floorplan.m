//
//  Floorplan.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Floorplan.h"
#import "Bubble.h"


@implementation Floorplan

@synthesize image_path, virtual_tour_path, info_bubbles;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.image_path = [dict objectForKey:@"image"];
		
		if ([dict objectForKey:@"virtual_tour"]) {
			self.virtual_tour_path = [dict objectForKey:@"virtual_tour"];
		} else {
			self.virtual_tour_path = nil;
		}
		
		if ([dict objectForKey:@"bubbles"]) {
			NSMutableArray *bubbles = [[NSMutableArray alloc] init];
			
			for (NSDictionary *bubbleData in [dict objectForKey:@"bubbles"]) {
				Bubble *bubble = [[Bubble alloc] initWithDictionary:bubbleData];
				
				[bubbles addObject:bubble];
				[bubble release];
			}
			
			self.info_bubbles = [[NSArray alloc] initWithArray:bubbles];
			
			[bubbles release];
		} else {
			self.info_bubbles = nil;
		}
	}
	
	return self;
}

- (void)dealloc {
	[image_path release];
	[virtual_tour_path release];
	[info_bubbles release];
	[super dealloc];
}

@end