//
//  HomeView.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "SectionButton.h"


@protocol HomeViewDelegate;

@interface HomeView : UIView <SectionButtonDelegate> {
	NSArray *tabs;
	UIToolbar *toolBar;
	
	id <HomeViewDelegate> delegate;
}

@property (nonatomic, retain) NSArray *tabs;
@property (nonatomic, retain) UIToolbar *toolBar;

@property (nonatomic, assign) id <HomeViewDelegate> delegate;

- (void)setFloorplanCount:(NSInteger)count;

@end

@protocol HomeViewDelegate
- (void)homeView:(HomeView *)view didSelectTab:(NSInteger)tabIndex;
@end