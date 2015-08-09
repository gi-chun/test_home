    //
//  ExFileView.m
//  Example
//
//  Created by dwcomms on 11. 3. 27..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExFileView.h"


@implementation ExFileView 


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"The_iPhone_Developers_Cookbook Building.pdf" ofType:nil];
	NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	viewFile = [[UIWebView alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 420.0)]; 
	[viewFile setOpaque:NO];
	[viewFile setScalesPageToFit:YES];
	[self.view addSubview:viewFile];
	
	[viewFile loadRequest:request];
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
	[viewFile release];
}


@end
