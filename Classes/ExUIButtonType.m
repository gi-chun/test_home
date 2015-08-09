    //
//  ExUIButtonType.m
//  Example
//
//  Created by dwcomms on 11. 4. 5..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIButtonType.h"


@implementation ExUIButtonType


- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:[UIColor blackColor]];
	
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[btn setFrame:CGRectMake(10, 10, 200, 40)];
		[btn setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:btn];
	}
	
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		[btn setFrame:CGRectMake(10, 60, 200, 40)];
		[btn setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:btn];
	}
	
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
		[btn setFrame:CGRectMake(10, 110, 200, 40)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[self.view addSubview:btn];
	}
	
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
		[btn setFrame:CGRectMake(10, 160, 200, 40)];
		[btn setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:btn];
	}
	
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
		[btn setFrame:CGRectMake(10, 210, 200, 40)];
		[btn setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:btn];
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
}


@end
