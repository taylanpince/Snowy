//
//  SectionButton.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface SectionButton : UIView {
	UILabel *titleLabel;
	UIImageView *iconView;
	
	NSInteger sectionIndex;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *iconView;

@property (nonatomic, assign, setter=setSectionIndex:) NSInteger sectionIndex;

@end
