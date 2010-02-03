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

@synthesize titleLabel, iconButton, sectionIndex, badgeCount, badgeIcon, badgeLabel, delegate;

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
		
		badgeIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"badge.png"]];
		badgeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		
		[badgeLabel setFont:[UIFont boldSystemFontOfSize:12.0]];
		[badgeLabel setBackgroundColor:[UIColor clearColor]];
		[badgeLabel setTextColor:[UIColor whiteColor]];
		[badgeLabel setTextAlignment:UITextAlignmentCenter];
		
		[self addSubview:badgeIcon];
		[self addSubview:badgeLabel];
		
		badgeCount = 0;
    }
	
    return self;
}

- (void)setSectionIndex:(NSInteger)newSectionIndex {
	sectionIndex = newSectionIndex;
	
	[self setNeedsLayout];
}

- (void)setBadgeCount:(NSInteger)newBadgeCount {
	if (badgeCount != newBadgeCount) {
		badgeCount = newBadgeCount;
		
		[self setNeedsLayout];
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[titleLabel setFrame:CGRectMake(0.0, 71.0, self.bounds.size.width, 40.0)];
	[iconButton setFrame:CGRectMake(20.0, 20.0, 67.0, 51.0)];
	
	if (badgeCount > 0) {
		[badgeIcon setFrame:CGRectMake(64.0, 16.0, 28.0, 27.0)];
		[badgeLabel setFrame:CGRectMake(64.0, 15.0, 28.0, 27.0)];
		[badgeLabel setText:[NSString stringWithFormat:@"%d", badgeCount]];
		
		[badgeIcon setHidden:NO];
		[badgeLabel setHidden:NO];
	} else {
		[badgeIcon setHidden:YES];
		[badgeLabel setHidden:YES];
	}
}

- (void)didTouchIconButton:(id)sender {
	[delegate didTouchSectionButton:self];
}

- (void)dealloc {
	[titleLabel release];
	[iconButton release];
	[badgeLabel release];
	[badgeIcon release];
    [super dealloc];
}

@end