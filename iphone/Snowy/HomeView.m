//
//  HomeView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "HomeView.h"
#import "Location.h"


@interface HomeView (PrivateMethods)
- (void)switchSection:(id)sender;
@end


@implementation HomeView

@synthesize delegate, tabs;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		tabs = [[NSMutableArray alloc] init];
		
		[self setBackgroundColor:[UIColor darkGrayColor]];
    }
	
    return self;
}

- (void)setLocations:(NSArray *)locations {
	for (Location *location in locations) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		
		[button setImage:[UIImage imageNamed:location.image_path] forState:UIControlStateNormal];
		[button setImage:[UIImage imageNamed:location.image_on_path] forState:UIControlStateHighlighted];
		[button addTarget:self action:@selector(switchSection:) forControlEvents:UIControlEventTouchDown];
		
		[self addSubview:button];
		[tabs addObject:button];
	}
	
	[self setNeedsLayout];
}

- (void)switchSection:(id)sender {
	[delegate homeView:self didSelectTab:[tabs indexOfObject:sender]];
}

- (void)layoutSubviews {
	NSInteger index = 0;;
	
	for (UIButton *button in tabs) {
		[button setFrame:CGRectMake(160.0 * (index % 2), 230.0 * ((index / 2) % 2), 160.0, 230.0)];
		
		index += 1;
	}
}

- (void)dealloc {
	[tabs release];
    [super dealloc];
}

@end