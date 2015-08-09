//
//  ExUITabBarControllerCustom.h
//  Example
//
//  Created by dwcomms on 11. 1. 21..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuList.h"
#import "ExUIView.h"

@interface ExUITabBarControllerCustom : UIViewController <UITabBarControllerDelegate>{
	
	UITabBarController *tabController;

}

- (void) pushUpBtn : (UIButton*) sender;

@end
