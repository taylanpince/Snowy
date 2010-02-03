//
//  Floorplan.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Bubble.h"
#import "Location.h"
#import "Floorplan.h"
#import "SnowyAppDelegate.h"


@interface Floorplan (PrivateMethods)
- (NSDictionary *)bookmarkItem;
@end


@implementation Floorplan

@synthesize number, image_path, virtual_tour_path, info_bubbles, property;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.number = [[dict objectForKey:@"id"] intValue];
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

- (NSDictionary *)bookmarkItem {
	return [NSDictionary dictionaryWithObjectsAndKeys:
			[NSNumber numberWithInt:self.number], @"floorplan",
			[NSNumber numberWithInt:self.property.number], @"property",
			[NSNumber numberWithInt:self.property.location.number], @"location", nil
	];
}

- (BOOL)isBookmarked {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSArray *bookmarkedItems = [prefs arrayForKey:@"savedFloorplans"];
	
	if (bookmarkedItems != nil) {
		return ([bookmarkedItems containsObject:[self bookmarkItem]]);
	} else {
		return NO;
	}
}

- (void)toggleBookmark {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSMutableArray *bookmarkedItems = [[prefs arrayForKey:@"savedFloorplans"] mutableCopy];
	NSDictionary *bookmarkObject = [self bookmarkItem];
	
	if (bookmarkedItems != nil) {
		if ([bookmarkedItems containsObject:bookmarkObject]) {
			[bookmarkedItems removeObject:bookmarkObject];
			[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] removeFloorplan:self];
		} else {
			[bookmarkedItems addObject:bookmarkObject];
			[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] saveFloorplan:self];
		}
	} else {
		bookmarkedItems = [[NSMutableArray alloc] initWithObjects:bookmarkObject, nil];
		[(SnowyAppDelegate *)[[UIApplication sharedApplication] delegate] saveFloorplan:self];
	}
	
	[prefs setObject:bookmarkedItems forKey:@"savedFloorplans"];
	[bookmarkedItems release];
}

- (void)dealloc {
	[image_path release];
	[virtual_tour_path release];
	[info_bubbles release];
	[property release];
	[super dealloc];
}

@end