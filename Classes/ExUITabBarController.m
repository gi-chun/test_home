    //
//  ExUITabBarController.m
//  Example
//
//  Created by dwcomms on 11. 1. 21..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITabBarController.h"


@implementation ExUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	tabController = [[UITabBarController alloc] init];
	
	
	NSMutableArray* array = [[NSMutableArray alloc] init];
	
	{

		UINavigationController	*navi = [[UINavigationController alloc] initWithRootViewController:[MenuList new]];
		[navi.tabBarItem setTitle:@"MenuList"];
		[navi.tabBarItem setImage:[UIImage imageNamed:@"gnb_app_off.png"]];
		[array addObject: navi];
		[navi release];
	}
	
	{
		ExUIView *navi = [[ExUIView alloc] init];
		[navi.tabBarItem setTitle:@"ExUIView"];
		[navi.tabBarItem setImage:[UIImage imageNamed:@"gnb_app_on.png"]];
		[array addObject: navi];
		[navi release];
	}
	
	
	[tabController setViewControllers:array];
	[tabController setDelegate:self];
	[tabController.view setFrame:CGRectMake(0.0, 0.0, 320.0, 460.0)];
	
	[self.view addSubview:tabController.view];
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[tabController release];
	
}


@end
