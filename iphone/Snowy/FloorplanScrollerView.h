//
//  FloorplanScrollerView.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface FloorplanScrollerView : UIView {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageControl;

@end
