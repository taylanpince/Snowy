//
//  VirtualTourView.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-01.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "VirtualTourView.h"


@interface VirtualTourView (PrivateMethods)
- (void)didTouchInfoButton:(id)sender;
@end


@implementation VirtualTourView

@synthesize imageView, imagePath, scrollView, infoButton, toolBar, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor lightGrayColor]];
		
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
		
		[scrollView setShowsVerticalScrollIndicator:NO];
		[scrollView setShowsHorizontalScrollIndicator:NO];
		
		[self addSubview:scrollView];
		[scrollView addSubview:imageView];
		
		infoButton = [[UIButton buttonWithType:UIButtonTypeInfoDark] retain];
		
		[infoButton addTarget:self action:@selector(didTouchInfoButton:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:infoButton];
		
		toolBar = [[UIToolbar alloc] initWithFrame:CGRectZero];
		
		UILabel *bubbleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:bubbleLabel];
		
		[bubbleLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
		[bubbleLabel setTextColor:[UIColor whiteColor]];
		[bubbleLabel setBackgroundColor:[UIColor clearColor]];
		[bubbleLabel setTextAlignment:UITextAlignmentCenter];
		[bubbleLabel setText:@"Swipe around the image to see more"];
		
		[toolBar setItems:[NSArray arrayWithObjects:labelItem, nil]];
		[self addSubview:toolBar];
		[bubbleLabel release];
		[labelItem release];
		
		imagePath = nil;
    }
	
    return self;
}

- (void)setImagePath:(NSString *)newImagePath {
	if (imagePath != newImagePath) {
		[imagePath release];
		
		imagePath = [newImagePath retain];
		
		UIImage *image = [UIImage imageNamed:imagePath];
		
		[imageView setImage:image];
		[scrollView setContentSize:image.size];
		[self setNeedsLayout];
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[imageView sizeToFit];
	[scrollView setFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height - 44.0)];
	[toolBar setFrame:CGRectMake(0.0, self.bounds.size.height - 44.0, self.bounds.size.width, 44.0)];
	[[[[toolBar items] objectAtIndex:0] customView] setFrame:CGRectInset(toolBar.bounds, 10.0, 6.0)];
	[infoButton setFrame:CGRectMake(self.bounds.size.width - 40.0, self.bounds.size.height - 84.0, 30.0, 30.0)];
}

- (void)didTouchInfoButton:(id)sender {
	[delegate virtualTourViewDidTouchInfoButton:self];
}

- (void)dealloc {
	[imagePath release];
	[imageView release];
	[scrollView release];
	[infoButton release];
	[toolBar release];
    [super dealloc];
}

@end