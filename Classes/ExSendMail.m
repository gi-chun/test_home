    //
//  ExSendMail.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExSendMail.h"


@implementation ExSendMail



- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSArray *toArr = [[NSArray alloc] initWithObjects:@"aaaaa@aaa.com", @"bbbb@bbb.net", nil];
	NSArray *ccArr = [[NSArray alloc] initWithObjects:@"ccc@cccc.com", @"dd@dddd.net", @"eeee@eee.co.kr", nil];
	NSArray *bccArr = [[NSArray alloc] initWithObjects:@"fff@fffff.com", nil];

	
	MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
	[controller setMailComposeDelegate:self];
	[controller setToRecipients:toArr];
	[controller setCcRecipients:ccArr];
	[controller setBccRecipients:bccArr];
	[controller setSubject:@"메일의 제목입니다."];
	[controller setMessageBody:@"메일의 내용입니다." isHTML:NO];
	[self presentModalViewController:controller animated:YES];
	[controller release];
	
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
		  didFinishWithResult:(MFMailComposeResult)result
						error:(NSError*)error; {
	if (result == MFMailComposeResultSent) {
		NSLog(@"mail send!");
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:@"메일발송" 
							  message:@"발송되었습니다." 
							  delegate:self 
							  cancelButtonTitle:@"CLOSE"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];		
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:@"메일 미발송" 
							  message:@"메일 발송이 취소되었습니다." 
							  delegate:self 
							  cancelButtonTitle:@"CLOSE"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

	
	[self dismissModalViewControllerAnimated:YES];
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
