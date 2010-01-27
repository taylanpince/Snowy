//
//  Property.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface Property : NSObject {
	NSString *name;
	NSString *image_path;
	NSString *header_image_path;
	NSMutableArray *floorplans;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *image_path;
@property (nonatomic, retain) NSString *header_image_path;
@property (nonatomic, retain) NSMutableArray *floorplans;

- (id)initWithDictionary:(NSDictionary *)dict;

@end