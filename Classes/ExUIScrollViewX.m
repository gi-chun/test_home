    //
//  ExUIScrollViewX.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIScrollViewX.h"


@implementation ExUIScrollViewX

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIScrollView *ScrollView = [[UIScrollView alloc] init];
	[ScrollView setFrame:CGRectMake(0.0, 20.0, 320.0, 300.0)];
	[ScrollView setBackgroundColor:[UIColor blueColor]];
	[ScrollView setContentSize:CGSizeMake(800.0, 300.0)];
	[self.view addSubview:ScrollView];
	[ScrollView release];
	
	
	
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
