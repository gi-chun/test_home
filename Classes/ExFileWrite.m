    //
//  ExFileWrite.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExFileWrite.h"


@implementation ExFileWrite


- (void)viewDidLoad {
    [super viewDidLoad];
	
	{
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50.0, 10.0, 100.0, 40.0)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[btn setTitle:@"Save" forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(saveImg) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];	
		[btn release];
		
	}
	{
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(170.0, 10.0, 100.0, 40.0)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[btn setTitle:@"Delete" forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(deleteImg) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];	
		[btn release];
	}
	
	imgView = [[UIImageView alloc] initWithFrame:CGRectMake(110.0, 180.0, 100.0, 80.0)];
	[self.view addSubview:imgView];
	
	indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145.0, 180.0, 30.0, 30.0)];
	[indicator setHidesWhenStopped:YES];
	[indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:indicator];
	
	
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

- (void) saveImg {
	
	if (imgView.image == nil) {
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:nil 
							  message:@"저장 할 이미지가 없습니다." 
							  delegate:self 
							  cancelButtonTitle:@"확인"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];	
	}
	
	else {
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
															 NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		
		NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"SaveImgFolder"];
		
		if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
			[[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
		
		[indicator startAnimating];
		
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(writeFile) userInfo:nil repeats:NO];
	}
}

- (void) writeFile {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														 NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"SaveImgFolder"];
	
	NSString* path = [dataPath stringByAppendingPathComponent:[NSString stringWithFormat:@"home-ios-sdk.png"]];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
		
		NSData* data = UIImagePNGRepresentation(imgView.image);
		
		[data writeToFile:path atomically:YES];
		
		[indicator stopAnimating];
		
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:nil 
							  message:@"저장이 완료되었습니다." 
							  delegate:self 
							  cancelButtonTitle:@"확인"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else {
		
		[indicator stopAnimating];
		
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:nil 
							  message:@"이미 저장 된 이미지입니다." 
							  delegate:self 
							  cancelButtonTitle:@"확인"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	NSArray *arrFileName = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/SaveImgFolder"] error:nil];
	
	Log(@"arrFileName : %@", arrFileName);
	
}

- (void) deleteImg {
	
	NSString *filePath = [NSString stringWithFormat:@"%@/home-ios-sdk.png", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/SaveImgFolder"]];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:nil 
							  message:@"저장 된 이미지가 없습니다." 
							  delegate:self 
							  cancelButtonTitle:@"확인"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];	
	}
	else {
		
		[indicator startAnimating];
		
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(deleteFile) userInfo:nil repeats:NO];		
	}

}

- (void) deleteFile {
	
	NSString *filePath = [NSString stringWithFormat:@"%@/home-ios-sdk.png", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/SaveImgFolder"]];
	
	[[NSFileManager defaultManager] removeItemAtPath:filePath error:nil]; 
	
	[indicator stopAnimating];
	
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:nil 
						  message:@"이미지가 삭제되었습니다." 
						  delegate:self 
						  cancelButtonTitle:@"확인"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	
	NSArray *arrFileName = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/SaveImgFolder"] error:nil];
	
	Log(@"arrFileName : %@", arrFileName);

}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response { 

	Log(@"Receive: %@, %@, %d", [response URL], [response MIMEType], [response expectedContentLength]);
	
	[receivedData setLength:0]; 
} 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data { 

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
	[indicator release];
}


@end
