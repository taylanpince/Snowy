//
//  HomeView.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "HomeView.h"


@implementation HomeView

@synthesize tabs, toolBar, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor whiteColor]];
		
		toolBar = [[UIToolbar alloc] initWithFrame:CGRectZero];
		
		UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		UIBarButtonItem *labelItem = [[UIBarButtonItem alloc] initWithCustomView:welcomeLabel];
		
		[welcomeLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
		[welcomeLabel setTextColor:[UIColor whiteColor]];
		[welcomeLabel setBackgroundColor:[UIColor clearColor]];
		[welcomeLabel setTextAlignment:UITextAlignmentCenter];
		[welcomeLabel setText:@"Welcome back!"];
		
		[toolBar setTintColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
		[toolBar setItems:[NSArray arrayWithObjects:labelItem, nil]];
		[self addSubview:toolBar];
		[welcomeLabel release];
		[labelItem release];
		
		NSArray *sections = [NSArray arrayWithObjects:
			[NSDictionary dictionaryWithObjectsAndKeys:@"Minto\nProperties", @"label", @"button-properties.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Find a\nMinto Rep", @"label", @"button-reps.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Floorplans", @"label", @"button-floorplans.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Budget Calculator", @"label", @"button-calculator.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Share\nwith a friend", @"label", @"button-share.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Reviews\nand Ratings", @"label", @"button-reviews.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"My\nNeighbourhoods", @"label", @"button-neighborhoods.png", @"image_path", nil],
			[NSDictionary dictionaryWithObjectsAndKeys:@"Minto\nTips", @"label", @"button-tips.png", @"image_path", nil], nil
		];
		
		NSMutableArray *sectionButtons = [[NSMutableArray alloc] init];
		
		for (NSDictionary *section in sections) {
			UIImageView *button = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[section objectForKey:@"image_path"]]];
			
			[self addSubview:button];
			[sectionButtons addObject:button];
			[button release];
		}
		
		tabs = [[NSArray alloc] initWithArray:sectionButtons];
		
		[sectionButtons release];
    }
	
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[toolBar setFrame:CGRectMake(0.0, self.bounds.size.height - 44.0, self.bounds.size.width, 44.0)];
	[[[[toolBar items] objectAtIndex:0] customView] setFrame:CGRectInset(toolBar.bounds, 10.0, 6.0)];
	
	int index = 0;
	CGFloat topOffset = 0.0;
	CGFloat leftOffset = 0.0;
	
	for (UIImageView *button in tabs) {
		[button setFrame:CGRectMake(20.0 + leftOffset, 37.0 + topOffset, 67.0, 51.0)];
		
		index += (index == 3) ? 2 : 1;
		leftOffset = (index % 3 == 0) ? 0.0 : leftOffset + 106.0;
		
		if (index == 5) leftOffset += 106.0;
		if (index % 3 == 0) topOffset += 125.0;
	}
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	[[UIImage imageNamed:@"logo.png"] drawInRect:CGRectMake(121.0, 149.0, 77.0, 77.0)];
}

- (void)dealloc {
	[tabs release];
	[toolBar release];
    [super dealloc];
}

@end