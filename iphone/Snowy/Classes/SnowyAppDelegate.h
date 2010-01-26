//
//  SnowyAppDelegate.h
//  Snowy
//
//  Created by Taylan Pince on 10-01-25.
//  Copyright Hippo Foundry 2010. All rights reserved.
//

@interface SnowyAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;

@end

