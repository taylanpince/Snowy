//
//  FloorplanView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplanView.h"


@implementation FloorplanView

@synthesize imagePath, imageView, bookmarkButton;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		bookmarkButton = [[UIButton buttonWithType:UIButtonTypeContactAdd] retain];
		
		[self addSubview:imageView];
		[self addSubview:bookmarkButton];
		[self setBackgroundColor:[UIColor darkGrayColor]];
    }
	
    return self;
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
}

- (void)dealloc {
	[imageView release];
	[imagePath release];
	[bookmarkButton release];
    [super dealloc];
}

@end