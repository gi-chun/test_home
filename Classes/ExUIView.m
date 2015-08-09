    //
//  ExUIView.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIView.h"


@implementation ExUIView

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
	
	UIView *redView = [[UIView alloc] init];

	[redView setFrame:CGRectMake(100.0, 100.0, 100.0, 100.0)];
	[redView setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:redView];
	[redView release];
	
	UIView *blueView = [[UIView alloc] init];

	[blueView setFrame:CGRectMake(150.0, 150.0, 100.0, 100.0)];
	[blueView setBackgroundColor:[UIColor blueColor]];
	[self.view addSubview:blueView];
	[blueView release];
	
	UIView *blackView = [[UIView alloc] init];

	[blackView setFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
	[blackView setBackgroundColor:[UIColor blackColor]];
	[redView addSubview:blackView]; 
	[blackView release];
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
