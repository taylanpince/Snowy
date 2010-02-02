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

@synthesize imageView, imagePath, scrollView, infoButton, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor lightGrayColor]];
		
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
		
		[self addSubview:scrollView];
		[scrollView addSubview:imageView];
		
		infoButton = [[UIButton buttonWithType:UIButtonTypeInfoDark] retain];
		
		[infoButton addTarget:self action:@selector(didTouchInfoButton:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:infoButton];
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
	
	[imageView setFrame:self.bounds];
	[infoButton setFrame:CGRectMake(self.bounds.size.width - 40.0, self.bounds.size.height - 40.0, 30.0, 30.0)];
}

- (void)didTouchInfoButton:(id)sender {
	[delegate virtualTourViewDidTouchInfoButton:self];
}

- (void)dealloc {
	[imagePath release];
	[imageView release];
	[scrollView release];
	[infoButton release];
    [super dealloc];
}

@end