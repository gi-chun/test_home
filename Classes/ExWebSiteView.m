    //
//  ExWebSiteView.m
//  Example
//
//  Created by dwcomms on 11. 3. 27..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExWebSiteView.h"

             
@implementation ExWebSiteView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	urlText = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30.0)];
	[urlText setBorderStyle:UITextBorderStyleRoundedRect];
	[urlText setKeyboardType:UIKeyboardTypeURL];
	[urlText setReturnKeyType:UIReturnKeyGo];
	[urlText setDelegate:self];
	[urlText setText:@"http://"];
	[self.view addSubview:urlText];
	
	webPageView = [[UIWebView alloc] initWithFrame: CGRectMake(0.0, 50.0, 320.0, 410.0)]; 
	[webPageView setBackgroundColor:[UIColor whiteColor]];
	[webPageView setDelegate:self];
	[webPageView setScalesPageToFit:YES];
	[self.view addSubview:webPageView];
	
	indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145.0, 180.0, 30.0, 30.0)];
	[indicator setHidesWhenStopped:YES];
	[indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:indicator];
	
	
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	
	[indicator startAnimating];
	
	NSURL *URL = [NSURL URLWithString:urlText.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	
	[webPageView loadRequest:request];
	
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	
	[indicator stopAnimating];

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
	[urlText release];
	[webPageView release];
	[indicator release];
}


@end
