//
//  FloorplanView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplanView.h"


@interface FloorplanView (PrivateMethods)
- (void)didTouchBookmarkButton:(id)sender;
- (void)didTouchInfoButton:(id)sender;
@end


@implementation FloorplanView

@synthesize imagePath, imageView, bookmarkButton, infoButton, bookmarked, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		bookmarkButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		infoButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		
		[bookmarkButton setImage:[UIImage imageNamed:@"bookmark.png"] forState:UIControlStateNormal];
		[bookmarkButton setImage:[UIImage imageNamed:@"bookmark-on.png"] forState:UIControlStateSelected];
		[infoButton setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
		
		[infoButton addTarget:self action:@selector(didTouchInfoButton:) forControlEvents:UIControlEventTouchUpInside];
		[bookmarkButton	addTarget:self action:@selector(didTouchBookmarkButton:) forControlEvents:UIControlEventTouchUpInside];
		
		[self addSubview:imageView];
		[self addSubview:bookmarkButton];
		[self addSubview:infoButton];
		[self setBackgroundColor:[UIColor darkGrayColor]];
		
		bookmarked = NO;
    }
	
    return self;
}

- (void)setBookmarked:(BOOL)state {
	if (state != bookmarked) {
		bookmarked = state;
		
		[bookmarkButton setSelected:bookmarked];
	}
}

- (void)setImagePath:(NSString *)newImagePath {
	if (imagePath != newImagePath) {
		[imagePath release];
		
		imagePath = [newImagePath retain];
		
		[imageView setImage:[UIImage imageNamed:imagePath]];
		[self setNeedsLayout];
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[imageView setFrame:self.bounds];
	[bookmarkButton setFrame:CGRectMake(self.frame.size.width - 40.0, 10.0, 30.0, 30.0)];
	[infoButton setFrame:CGRectMake(self.frame.size.width - 40.0, self.frame.size.height - 40.0, 30.0, 30.0)];
}

- (void)didTouchInfoButton:(id)sender {
	[delegate floorplanViewDidTouchInfoButton:self];
}

- (void)didTouchBookmarkButton:(id)sender {
	[self setBookmarked:!bookmarked];
	[delegate floorplanViewDidTouchBookmarkButton:self];
}

- (void)dealloc {
	[imageView release];
	[imagePath release];
	[bookmarkButton release];
	[infoButton release];
    [super dealloc];
}

@end