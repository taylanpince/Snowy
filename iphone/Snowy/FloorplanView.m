//
//  FloorplanView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "FloorplanView.h"


@implementation FloorplanView

@synthesize imagePath, imageView;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		
		[self addSubview:imageView];
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
}

- (void)dealloc {
	[imageView release];
	[imagePath release];
    [super dealloc];
}

@end