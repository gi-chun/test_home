    //
//  ExImageLoad.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExImageLoad.h"


@implementation ExImageLoad


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	imgView = [[UIImageView alloc] initWithFrame:CGRectMake(110.0, 180.0, 100.0, 80.0)];
	[self.view addSubview:imgView];
			   
	NSString *URL = @"http://devimages.apple.com/home/images/home-ios-sdk.png";

	NSURL *fileURL = [NSURL URLWithString:URL]; 
	
	NSURLRequest *req = [NSURLRequest requestWithURL:fileURL]; 
	
	NSURLConnection *conn = [NSURLConnection connectionWithRequest:req delegate:self]; 
	
	if (conn)  
	{         
		receivedData = [[NSMutableData data] retain];	 
		Log(@"downloading"); 
	}  
	else  
	{ 
		Log(@"not downloading"); 
		// inform the user that the download could not be made 
	}
	
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response { 
	// this method is called when the server has determined that it 
	// has enough information to create the NSURLResponse 
	// it can be called multiple times, for example in the case of a 
	// redirect, so each time we reset the data. 
	// receivedData is declared as a method instance elsewhere 
	Log(@"Receive: %@, %@, %d", [response URL], [response MIMEType], [response expectedContentLength]);
	
	[receivedData setLength:0]; 
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data { 
	// append the new data to the receivedData 
	// receivedData is declared as a method instance elsewhere
	[receivedData appendData:data];
} 

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error { 

	
	if (error != NULL) {
		// Show error message...
		Log(@"save error");
    } else {
		Log(@"save success");
	}
	
	[connection release]; 
	
	// receivedData is declared as a method instance elsewhere 
	if( receivedData != nil) {
		[receivedData release]; 
		receivedData = nil;
	}
} 

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
	UIImage *image = [UIImage imageWithData:receivedData];

	[imgView setImage:image];

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
	[imgView release];
	
}


@end
