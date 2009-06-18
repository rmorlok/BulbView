//
//  LcdiPhoneAppDelegate.m
//  LcdiPhone
//
//  Created by Ryan Morlok on 5/26/09.
//  Copyright Morlok Technologies 2009. All rights reserved.
//

#import "LcdiPhoneAppDelegate.h"
#import "MainViewController.h"

@implementation LcdiPhoneAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
