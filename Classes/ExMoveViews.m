    //
//  ExMoveViews.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExMoveViews.h"


@implementation ExMoveViews


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	MoveView *viewsGray = [[MoveView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
	[viewsGray setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:viewsGray];
	[viewsGray release];
	
	MoveView *viewsRed = [[MoveView alloc] initWithFrame:CGRectMake(50.0, 50.0, 50.0, 50.0)];
	[viewsRed setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:viewsRed];
	[viewsRed release];
	
	MoveView *viewsBlue = [[MoveView alloc] initWithFrame:CGRectMake(100.0, 0.0, 50.0, 50.0)];
	[viewsBlue setBackgroundColor:[UIColor blueColor]];
	[self.view addSubview:viewsBlue];
	[viewsBlue release];
	
	MoveView *viewsGreen = [[MoveView alloc] initWithFrame:CGRectMake(150.0, 100.0, 50.0, 50.0)];
	[viewsGreen setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:viewsGreen];
	[viewsGreen release];
	
	MoveView *viewsBlack = [[MoveView alloc] initWithFrame:CGRectMake(200.0, 150.0, 50.0, 50.0)];
	[viewsBlack setBackgroundColor:[UIColor blackColor]];
	[self.view addSubview:viewsBlack];
	[viewsBlack release];
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
