    //
//  ExURLFileJSON.m
//  Example
//
//  Created by dwcomms on 11. 3. 22..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExURLFileJSON.h"


@implementation ExURLFileJSON



- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *urlStr = @"http://api.twitter.com/1/statuses/public_timeline.json";
	NSLog(@"log[%@]", urlStr);
	
	NSURL *url = [NSURL URLWithString:urlStr];
	
	
	NSData *webJsonData = [NSData dataWithContentsOfURL:(NSURL *)url];
	
	NSString *dataStr = [[NSString alloc] initWithData:webJsonData encoding:NSUTF8StringEncoding];
	
	NSDictionary *responseObject = [dataStr JSONValue];
	
	NSLog(@"responseObject : %@", responseObject);
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
