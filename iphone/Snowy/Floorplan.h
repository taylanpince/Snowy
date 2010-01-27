//
//  Floorplan.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface Floorplan : NSObject {
	NSString *image_path;
}

@property (nonatomic, retain) NSString *image_path;

- (id)initWithDictionary:(NSDictionary *)dict;

@end