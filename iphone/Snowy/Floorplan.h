//
//  Floorplan.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface Floorplan : NSObject {
	NSString *image_path;
	NSString *virtual_tour_path;
	NSArray *info_bubbles;
}

@property (nonatomic, retain) NSString *image_path;
@property (nonatomic, retain) NSString *virtual_tour_path;
@property (nonatomic, retain) NSArray *info_bubbles;

- (id)initWithDictionary:(NSDictionary *)dict;

@end