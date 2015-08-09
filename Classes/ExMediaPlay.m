    //
//  ExMediaPlay.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExMediaPlay.h"


@implementation ExMediaPlay


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *url = @"http://pds19.egloos.com/pds/201102/25/28/test.mov";
	
	NSURL *movieURL = [NSURL URLWithString:url];
	
	theMovie = [[MPMoviePlayerController alloc] initWithContentURL: movieURL];
	[theMovie setScalingMode:MPMovieScalingModeAspectFit];
	[theMovie setControlStyle:MPMovieControlStyleEmbedded];
	[theMovie setShouldAutoplay:YES];

	movieView = [theMovie view];
	[movieView setFrame: CGRectMake(10, 100, 300, 200)];
	[self.view addSubview:movieView];	
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
	[theMovie release];

}


@end
