    //
//  ExTouchMove.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExTouchMove.h"


@implementation ExTouchMove



- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(300.0, 200.0, 320.0, 200.0)];
	[moveView setBackgroundColor:[UIColor grayColor]];
	[moveView setTag:9999];
	[self.view addSubview:moveView];
	[moveView release];
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	Log(@"point.x  - %f", point.x);
	Log(@"point.y  - %f", point.y);
	
	UIView *moveView = (UIView *)[self.view viewWithTag:9999];
	
	CGRect viewPosition = [moveView frame];
	viewPosition.origin.x = point.x;
	
	[moveView setFrame:viewPosition];
	
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
