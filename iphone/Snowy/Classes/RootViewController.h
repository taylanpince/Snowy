//
//  RootViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "HomeView.h"


@interface RootViewController : UIViewController <HomeViewDelegate> {
	NSArray *condos;
}

@property (nonatomic, retain) NSArray *condos;

@end
