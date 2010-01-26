//
//  FloorplanView.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-26.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//


@interface FloorplanView : UIView {
	NSInteger floorplanIndex;
	NSString *imagePath;
	UIImageView *imageView;
	UIButton *bookmarkButton;
}

@property (nonatomic, retain) NSString *imagePath;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIButton *bookmarkButton;

@end
