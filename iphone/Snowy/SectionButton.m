//
//  SectionButton.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "SectionButton.h"


@interface SectionButton (PrivateMethods)
- (void)didTouchIconButton:(id)sender;
@end


@implementation SectionButton

@synthesize titleLabel, iconButton, sectionIndex, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		iconButton = [[UIButton alloc] initWithFrame:CGRectZero];
		
		[iconButton addTarget:self action:@selector(didTouchIconButton:) forControlEvents:UIControlEventTouchUpInside];
		
		[titleLabel setFont:[UIFont boldSystemFontOfSize:11.0]];
		[titleLabel setTextAlignment:UITextAlignmentCenter];
		[titleLabel setTextColor:[UIColor blackColor]];
		[titleLabel setBackgroundColor:[UIColor whiteColor]];
		[titleLabel setNumberOfLines:2];
		[titleLabel setLineBreakMode:UILineBreakModeWordWrap];
		
		[self addSubview:titleLabel];
		[self addSubview:iconButton];
		[self setBackgroundColor:[UIColor whiteColor]];
    }
	
    return self;
}

- (void)setSectionIndex:(NSInteger)newSectionIndex {
	sectionIndex = newSectionIndex;
	
	[self setNeedsLayout];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[titleLabel setFrame:CGRectMake(0.0, 71.0, self.bounds.size.width, 40.0)];
	[iconButton setFrame:CGRectMake(20.0, 20.0, 67.0, 51.0)];
}

- (void)didTouchIconButton:(id)sender {
	[delegate didTouchSectionButton:self];
}

- (void)dealloc {
	[titleLabel release];
	[iconButton release];
    [super dealloc];
}

@end