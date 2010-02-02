//
//  LocationView.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol LocationViewDelegate;

@interface LocationView : UIView {
	NSMutableArray *tabs;
	
	id <LocationViewDelegate> delegate;
}

@property (nonatomic, retain) NSMutableArray *tabs;

@property (nonatomic, assign) id <LocationViewDelegate> delegate;

- (void)setLocations:(NSArray *)locations;

@end

@protocol LocationViewDelegate
- (void)locationView:(LocationView *)locationView didSelectTab:(NSInteger)tabIndex;
@end