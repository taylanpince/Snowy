//
//  RootViewController.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

#import "HomeView.h"
#import "LocationViewController.h"


@interface RootViewController : UIViewController <HomeViewDelegate, LocationViewControllerDelegate> {
	BOOL initialLaunch;
}

@end