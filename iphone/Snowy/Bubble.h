//
//  Bubble.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface Bubble : NSObject {
	double position_x;
	double position_y;
	
	NSString *label;
}

@property (nonatomic, assign) double position_x;
@property (nonatomic, assign) double position_y;

@property (nonatomic, retain) NSString *label;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
