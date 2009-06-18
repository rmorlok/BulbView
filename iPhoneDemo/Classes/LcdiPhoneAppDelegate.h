//
//  LcdiPhoneAppDelegate.h
//  LcdiPhone
//
//  Created by Ryan Morlok on 5/26/09.
//  Copyright Morlok Technologies 2009. All rights reserved.
//

@class MainViewController;

@interface LcdiPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

