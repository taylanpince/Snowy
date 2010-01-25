//
//  HomeView.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol HomeViewDelegate;

@interface HomeView : UIView {
	NSArray *tabs;
	
	id <HomeViewDelegate> delegate;
}

@property (nonatomic, retain) NSArray *tabs;

@property (nonatomic, assign) id <HomeViewDelegate> delegate;

@end

@protocol HomeViewDelegate
- (void)homeView:(HomeView *)homeView didSelectTab:(NSInteger)tabIndex;
@end