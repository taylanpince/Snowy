//
//  Floorplan.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"


@interface Floorplan : NSObject {
	int number;
	
	NSString *image_path;
	NSString *virtual_tour_path;
	NSArray *info_bubbles;
	
	Property *property;
}

@property (nonatomic, assign) int number;

@property (nonatomic, retain) NSString *image_path;
@property (nonatomic, retain) NSString *virtual_tour_path;
@property (nonatomic, retain) NSArray *info_bubbles;

@property (nonatomic, retain) Property *property;

- (id)initWithDictionary:(NSDictionary *)dict;
- (BOOL)isBookmarked;
- (void)toggleBookmark;

@end