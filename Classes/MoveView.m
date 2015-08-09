    //
//  MoveView.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MoveView.h"


@implementation MoveView

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint point = [[touches anyObject] locationInView:self.superview];
	
	Log(@"point.x  - %f", point.x);
	Log(@"point.y  - %f", point.y);
	
	CGRect viewPosition = [self frame];
	viewPosition.origin.x = point.x - self.frame.size.width/2;
	viewPosition.origin.y = point.y - self.frame.size.height/2;
	
	[self setFrame:viewPosition];
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
