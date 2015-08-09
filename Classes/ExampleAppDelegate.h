//
//  ExampleAppDelegate.h
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MenuList.h"

@class MenuList;

@interface ExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *mainMenu;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *mainMenu;

@end

