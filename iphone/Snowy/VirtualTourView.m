//
//  VirtualTourView.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-01.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "VirtualTourView.h"
#import "Bubble.h"


@interface VirtualTourView (PrivateMethods)
- (void)didTouchInfoButton:(id)sender;
- (void)didTouchInfoBubble:(id)sender;
@end


@implementation VirtualTourView

@synthesize imageView, imagePath, scrollView, infoButton, infoBubbles, toolBar, delegate;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor lightGrayColor]];
		
		imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
		
		[scrollView setShowsVerticalScrollIndicator:NO];
		[scrollView setShowsHorizontalScrollIndicator:NO];
		
		[self addSubview:scrollView];
		[scrollView addSubview:imageView];
		
		infoButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		
		[infoButton setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
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
		
		[toolBar setTintColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
		[toolBar setItems:[NSArray arrayWithObjects:labelItem, nil]];
		[self addSubview:toolBar];
		[bubbleLabel release];
		[labelItem release];
		
		imagePath = nil;
		infoBubbles = nil;
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

- (void)setInfoBubbles:(NSArray *)newInfoBubbles {
	if (infoBubbles != newInfoBubbles) {
		if (infoBubbles) {
			for (UIButton *bubbleButton in infoBubbles) {
				[bubbleButton removeFromSuperview];
			}
		}
		
		[infoBubbles release];
		
		NSMutableArray *bubbles = [[NSMutableArray alloc] init];
		
		for (Bubble *bubble in newInfoBubbles) {
			UIButton *bubbleButton = [UIButton buttonWithType:UIButtonTypeCustom];
			
			[bubbleButton setFrame:CGRectMake(bubble.position_x, bubble.position_y, 35.0, 35.0)];
			[bubbleButton setTitle:bubble.label forState:UIControlStateNormal];
			[bubbleButton setImage:[UIImage imageNamed:@"bubble.png"] forState:UIControlStateNormal];
			[bubbleButton setImage:[UIImage imageNamed:@"bubble-on.png"] forState:UIControlStateSelected];
			[bubbleButton addTarget:self action:@selector(didTouchInfoBubble:) forControlEvents:UIControlEventTouchUpInside];
			
			[scrollView addSubview:bubbleButton];
			[bubbles addObject:bubbleButton];
		}
		
		infoBubbles = [[NSArray alloc] initWithArray:bubbles];
		
		[bubbles release];
		[self setNeedsLayout];
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[imageView sizeToFit];
	[scrollView setFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height - 44.0)];
	[toolBar setFrame:CGRectMake(0.0, self.bounds.size.height - 44.0, self.bounds.size.width, 44.0)];
	[[[[toolBar items] objectAtIndex:0] customView] setFrame:CGRectInset(toolBar.bounds, 10.0, 6.0)];
	[infoButton setFrame:CGRectMake(self.bounds.size.width - 44.0, self.bounds.size.height - 86.0, 40.0, 40.0)];
}

- (void)didTouchInfoBubble:(id)sender {
	for (UIButton *bubbleButton in infoBubbles) {
		[bubbleButton setSelected:(UIButton *)sender == bubbleButton];
	}
	
	[(UILabel *)[[[toolBar items] objectAtIndex:0] customView] setText:[(UIButton *)sender titleForState:UIControlStateNormal]];
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
	[infoBubbles release];
    [super dealloc];
}

@end