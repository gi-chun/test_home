    //
//  ExTouchView.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExTouchView.h"




@implementation ExTouchView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	NSLog(@"startPoint.x  - %f", point.x);
	NSLog(@"startPoint.y  - %f", point.y);
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	NSLog(@"movePoint.x  - %f", point.x);
	NSLog(@"movePoint.y  - %f", point.y);	
	
	
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	NSLog(@"endPoint.x  - %f", point.x);
	NSLog(@"endPoint.y  - %f", point.y);
	
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
