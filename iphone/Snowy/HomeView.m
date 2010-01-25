//
//  HomeView.m
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "HomeView.h"


@interface HomeView (PrivateMethods)
- (void)switchSection:(id)sender;
@end


@implementation HomeView

@synthesize delegate, tabs;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		UIButton *floorplansTab = [UIButton buttonWithType:UIButtonTypeCustom];
		UIButton *calculatorTab = [UIButton buttonWithType:UIButtonTypeCustom];
		UIButton *appointmentsTab = [UIButton buttonWithType:UIButtonTypeCustom];
		UIButton *mycondoTab = [UIButton buttonWithType:UIButtonTypeCustom];
		
		[floorplansTab setImage:[UIImage imageNamed:@"tab-floorplans.png"] forState:UIControlStateNormal];
		[calculatorTab setImage:[UIImage imageNamed:@"tab-calculator.png"] forState:UIControlStateNormal];
		[appointmentsTab setImage:[UIImage imageNamed:@"tab-appointments.png"] forState:UIControlStateNormal];
		[mycondoTab setImage:[UIImage imageNamed:@"tab-mycondo.png"] forState:UIControlStateNormal];
		[floorplansTab setImage:[UIImage imageNamed:@"tab-floorplans-on.png"] forState:UIControlStateHighlighted];
		[calculatorTab setImage:[UIImage imageNamed:@"tab-calculator-on.png"] forState:UIControlStateHighlighted];
		[appointmentsTab setImage:[UIImage imageNamed:@"tab-appointments-on.png"] forState:UIControlStateHighlighted];
		[mycondoTab setImage:[UIImage imageNamed:@"tab-mycondo-on.png"] forState:UIControlStateHighlighted];
		
		tabs = [[NSArray alloc] initWithObjects:floorplansTab, calculatorTab, appointmentsTab, mycondoTab, nil];
		
		for (UIButton *button in tabs) {
			[button addTarget:self action:@selector(switchSection:) forControlEvents:UIControlEventTouchDown];
			[self addSubview:button];
		}
		
		[self setBackgroundColor:[UIColor darkGrayColor]];
    }
	
    return self;
}

- (void)switchSection:(id)sender {
	[delegate homeView:self didSelectTab:[tabs indexOfObject:sender]];
}

- (void)layoutSubviews {
	NSInteger index = 0;;
	
	for (UIButton *button in tabs) {
		[button setFrame:CGRectMake(160.0 * (index % 2), 209.0 * ((index / 2) % 2), 160.0, 209.0)];
		
		index += 1;
	}
}

- (void)dealloc {
	[tabs release];
    [super dealloc];
}

@end