    //
//  ExUITabBarControllerCustom.m
//  Example
//
//  Created by dwcomms on 11. 1. 21..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITabBarControllerCustom.h"






@implementation ExUITabBarControllerCustom


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	tabController = [[UITabBarController alloc] init];
	
	NSMutableArray* array = [[NSMutableArray alloc] init];
	
	{
		
		UINavigationController	*navi = [[UINavigationController alloc] initWithRootViewController:[MenuList new]];
		[navi.tabBarItem setTitle:@"MenuList"];
		[array addObject: navi];
		[navi release];
	}
	
	{
		UINavigationController	*navi = [[UINavigationController alloc] initWithRootViewController:[ExUIView new]];
		[navi.tabBarItem setTitle:@"ExUIView"];
		[array addObject: navi];
		[navi release];
	}
	
	[tabController setViewControllers:array];	
	[tabController setDelegate:self];
	[tabController.view setFrame:CGRectMake(0.0, 0.0, 320.0, 460.0)];
	[self.view addSubview:tabController.view];
	
	UIImage *btnOnImage = [UIImage imageNamed:@"menu_icon_on.png"];
	UIImage *btnOffImage = [UIImage imageNamed:@"menu_icon_off.png"];
	
	for (int btnCount = 0; btnCount < 2; btnCount++)
	{
		NSLog(@"btn");
		UIButton *tabBarBtn = [[UIButton alloc]initWithFrame:CGRectMake(160*btnCount, 0.0, 160.0, 60.0)];
		//tabBarBtn.backgroundColor = [UIColor redColor];
		[tabBarBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
		[tabBarBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
		[tabBarBtn setImage:btnOffImage forState:UIControlStateNormal];
		[tabBarBtn setImage:btnOnImage forState:UIControlStateSelected];		
		[tabBarBtn addTarget:self action: @selector(pushUpBtn:) forControlEvents:UIControlEventTouchUpInside];
		[tabBarBtn release];
		
		
		[tabBarBtn setSelected:NO];
		if (btnCount == 0) {
			[tabBarBtn setSelected:YES];
		}
		
		[tabBarBtn setTag:btnCount];
		
		[tabController.tabBar addSubview:tabBarBtn];
		[tabBarBtn release];
	}
	
}
- (void) pushUpBtn : (UIButton*) sender
{

	if(sender.selected)
		[sender setSelected:NO];
	else
		[sender setSelected:YES];
	
	NSArray *btnArray = [tabController.tabBar subviews];
	
	NSInteger preSelTabbarBtn = tabController.selectedIndex;
	
	if(sender.tag != preSelTabbarBtn)
	{
		for (int nBtnCount = 0; nBtnCount < [btnArray count]; nBtnCount++)
		{	
			if ([[btnArray objectAtIndex:nBtnCount] tag] == preSelTabbarBtn)
				((UIButton*)[btnArray objectAtIndex:nBtnCount]).selected = NO;
		}		
	}
	else
		[sender setSelected:YES];
	
	
	if (sender.selected)
	{
		[[tabController.viewControllers objectAtIndex:sender.tag] popToRootViewControllerAnimated:NO];
		[tabController setSelectedIndex:sender.tag];
	}
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[tabController release];
	
}


@end
