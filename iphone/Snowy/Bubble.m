//
//  Bubble.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Bubble.h"


@implementation Bubble

@synthesize position_x, position_y, label;

- (id)initWithDictionary:(NSDictionary *)dict {
	if (self = [super init]) {
		self.position_x = [[dict objectForKey:@"x"] doubleValue];
		self.position_y = [[dict objectForKey:@"y"] doubleValue];
		self.label = [dict objectForKey:@"text"];
	}
	
	return self;
}

- (void)dealloc {
	[label release];
	[super dealloc];
}

@end