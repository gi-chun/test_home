    //
//  ExUILabel.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUILabel.h"


@implementation ExUILabel

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
	
	{
		UILabel *label = [[UILabel alloc] init];
		[label setFrame:CGRectMake(20.0, 10.0, 250.0, 30.0)];
    	[label setText:@"How are you? ^_^"];
		[label setFont:[UIFont boldSystemFontOfSize:15.0]];
		//[self.view addSubview:label];
		[label release];
		
	}
	
	{
		UILabel *label = [[UILabel alloc] init];
		[label setFrame:CGRectMake(20.0, 50.0, 250.0, 30.0)];
    	[label setText:@"Hello World! Another World! Same World! Lovely World!"];
		[label setTextColor:[UIColor redColor]];
		[label setFont:[UIFont boldSystemFontOfSize:15.0]];
		[label setAdjustsFontSizeToFitWidth:YES];
		[self.view addSubview:label];
		[label release];
		
	}
	
	{
		UILabel *label = [[UILabel alloc] init];
		[label setFrame:CGRectMake(20.0, 90.0, 250.0, 30.0)];
		[label setNumberOfLines:0];
    	[label setText:@"Hello World! Another World! Same World! Lovely World!"];
		[label setTextColor:[UIColor redColor]];
		[label setAlpha:0.6f];
		[self.view addSubview:label];
		[label release];
	}
	
	{
		UILabel *label = [[UILabel alloc] init];
		[label setFrame:CGRectMake(20.0, 130.0, 250.0, 100.0)];
    	[label setText:@"Hello World! Another World! Same World! Lovely World!"];
		[label setTextColor:[UIColor redColor]];
		[label setLineBreakMode:UILineBreakModeCharacterWrap];
		[label setNumberOfLines:0];
		[label setBackgroundColor:[UIColor blueColor]];
		[self.view addSubview:label];
		[label release];
		
	}
	
	{
		UILabel *label = [[UILabel alloc] init];
		[label setFrame:CGRectMake(20.0, 240.0, 250.0, 100.0)];
    	[label setText:@"Hello World! Another World! Same World! Lovely World!"];
		[label setTextColor:[UIColor redColor]];
		[label setLineBreakMode:UILineBreakModeWordWrap];
		[label setNumberOfLines:0];
		//CGSize textSize = [label.text sizeWithFont:label.font constrainedToSize:label.frame.size lineBreakMode:label.lineBreakMode];
		//[label setFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, textSize.height)];
		[label setBackgroundColor:[UIColor blueColor]];		
		//[self.view addSubview:label];
		[label release];
		
	}
	
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
