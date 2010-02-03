//
//  Location.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-27.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface Location : NSObject {
	int number;
	
	NSString *name;
	NSString *image_path;
	NSString *image_on_path;
	NSMutableArray *properties;
	
	double latitude;
	double longitude;
}

@property (nonatomic, assign) int number;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *image_path;
@property (nonatomic, retain) NSString *image_on_path;
@property (nonatomic, retain) NSMutableArray *properties;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (id)initWithDictionary:(NSDictionary *)dict;
- (NSArray *)allFloorplans;

@end