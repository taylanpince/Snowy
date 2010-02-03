//
//  SectionButton.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol SectionButtonDelegate;

@interface SectionButton : UIView {
	UILabel *titleLabel;
	UIButton *iconButton;
	
	NSInteger sectionIndex;
	
	id <SectionButtonDelegate> delegate;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIButton *iconButton;

@property (nonatomic, assign, setter=setSectionIndex:) NSInteger sectionIndex;

@property (nonatomic, assign) id <SectionButtonDelegate> delegate;

@end

@protocol SectionButtonDelegate
- (void)didTouchSectionButton:(SectionButton *)section;
@end