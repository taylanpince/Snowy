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
	UIImageView *badgeIcon;
	UILabel *badgeLabel;
	
	NSInteger sectionIndex;
	NSInteger badgeCount;
	
	id <SectionButtonDelegate> delegate;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIButton *iconButton;
@property (nonatomic, retain) UIImageView *badgeIcon;
@property (nonatomic, retain) UILabel *badgeLabel;

@property (nonatomic, assign, setter=setSectionIndex:) NSInteger sectionIndex;
@property (nonatomic, assign, setter=setBadgeCount:) NSInteger badgeCount;

@property (nonatomic, assign) id <SectionButtonDelegate> delegate;

@end

@protocol SectionButtonDelegate
- (void)didTouchSectionButton:(SectionButton *)section;
@end