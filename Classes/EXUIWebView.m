    //
//  EXUIWebView.m
//  Example
//
//  Created by dwcomms on 11. 3. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EXUIWebView.h"
#import "JSON.h"


@implementation EXUIWebView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	UIWebView *req = [[UIWebView alloc] initWithFrame: CGRectMake(0.0, 0.0, 0.0, 0.0)]; 
	[req setDelegate:self];
	[req setOpaque:NO];
	[self.view addSubview:req];
	[req release];
	
	NSString *url = [NSString stringWithFormat:@"http://dwcomms.com/test/json02.asp?"];
	NSLog(@"log[%@]", url);
	
	
	[req loadRequest:[NSURLRequest requestWithURL:[[NSURL alloc] initWithString:url]]];
		
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	
	Log(@"[%@]", [webView stringByEvaluatingJavaScriptFromString: @"document.body.innerHTML;"]);
	
	NSString *str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.innerHTML;"];
	
	NSDictionary *responseObject = [str JSONValue];
	
	NSLog(@"responseObject : %@", responseObject);
	
	[webView release];
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
	
	Log(@"");
}


@end
