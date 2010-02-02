//
//  FloorplanView.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol FloorplanViewDelegate;

@interface FloorplanView : UIView {
	NSInteger floorplanIndex;
	NSString *imagePath;
	UIImageView *imageView;
	UIButton *bookmarkButton;
	UIButton *infoButton;
	
	id <FloorplanViewDelegate> delegate;
}

@property (nonatomic, retain) NSString *imagePath;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIButton *bookmarkButton;
@property (nonatomic, retain) UIButton *infoButton;

@property (nonatomic, assign) id <FloorplanViewDelegate> delegate;

@end

@protocol FloorplanViewDelegate
- (void)floorplanViewDidTouchInfoButton:(FloorplanView *)view;
- (void)floorplanViewDidTouchBookmarkButton:(FloorplanView *)view;
@end