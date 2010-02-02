//
//  HomeView.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol HomeViewDelegate;

@interface HomeView : UIView {
	NSArray *tabs;
	UIToolbar *toolBar;
	
	id <HomeViewDelegate> delegate;
}

@property (nonatomic, retain) NSArray *tabs;
@property (nonatomic, retain) UIToolbar *toolBar;

@property (nonatomic, assign) id <HomeViewDelegate> delegate;

@end

@protocol HomeViewDelegate
- (void)homeView:(HomeView *)view didSelectTab:(NSInteger)tabIndex;
@end