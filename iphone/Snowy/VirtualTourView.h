//
//  VirtualTourView.h
//  Snowy
//
//  Created by Taylan Pince on 10-02-01.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

@protocol VirtualTourViewDelegate;

@interface VirtualTourView : UIView {
	UIImageView *imageView;
	UIScrollView *scrollView;
	UIButton *infoButton;
	NSString *imagePath;
	
	id <VirtualTourViewDelegate> delegate;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) NSString *imagePath;

@property (nonatomic, assign) id <VirtualTourViewDelegate> delegate;

@end

@protocol VirtualTourViewDelegate
- (void)virtualTourViewDidTouchInfoButton:(VirtualTourView *)view;
@end