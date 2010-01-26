//
//  FloorplanScrollerView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplanScrollerView.h"


@implementation FloorplanScrollerView

@synthesize scrollView, pageControl;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
		
		[scrollView setPagingEnabled:YES];
		[scrollView setShowsVerticalScrollIndicator:NO];
		[scrollView setShowsHorizontalScrollIndicator:NO];
		[scrollView setScrollsToTop:NO];
		
		[self addSubview:scrollView];
		
		pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
		
		[pageControl setCurrentPage:0];
		
		[self addSubview:pageControl];
		[self setBackgroundColor:[UIColor blackColor]];
    }
	
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[scrollView setFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height - 20.0)];
	[pageControl setFrame:CGRectMake(0.0, self.frame.size.height - 20.0, self.frame.size.width, 20.0)];
}

- (void)dealloc {
    [super dealloc];
}

@end