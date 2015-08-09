    //
//  ExHTTP.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExHTTP.h"


@implementation ExHTTP


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *URL = @"http://api.twitter.com/1/users/show.json?user_id=12345";
	
	NSURL *fileURL = [NSURL URLWithString:URL]; 
	
	NSURLRequest *req = [NSURLRequest requestWithURL:fileURL]; 
	
	NSURLConnection *conn = [NSURLConnection connectionWithRequest:req delegate:self]; 
	
	if (conn)  
	{         
		receivedData = [[NSMutableData data] retain];	 
		Log(@"loading"); 
	}  
	else  
	{ 
		Log(@"not loading"); 
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response { 

	Log(@"Receive: %@, %@, %d", [response URL], [response MIMEType], [response expectedContentLength]);
	
	[receivedData setLength:0]; 
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data { 

	[receivedData appendData:data];
} 

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error { 
	
	[connection release]; 
	
	// receivedData is declared as a method instance elsewhere 
	if( receivedData != nil) {
		[receivedData release]; 
		receivedData = nil;
	}
} 

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
	Log(@"%@", receivedData);
	
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
