    //
//  ExSendMailWithImg.m
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExSendMailWithImg.h"


@implementation ExSendMailWithImg

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	UIButton *btnPhoto = [[UIButton alloc] initWithFrame:CGRectMake(100.0, 10.0, 120.0, 30.0)];
	[btnPhoto setBackgroundColor:[UIColor blackColor]];
	[btnPhoto setTitle:@"Select Image" forState:UIControlStateNormal];
	[btnPhoto setTitle:@"Select Image" forState:UIControlStateSelected];
	[btnPhoto addTarget:self action:@selector(selectImg) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnPhoto];
	[btnPhoto release];
	
	UIButton *btnMail = [[UIButton alloc] initWithFrame:CGRectMake(100.0, 50.0, 120.0, 30.0)];
	[btnMail setBackgroundColor:[UIColor blackColor]];
	[btnMail setTitle:@"Send Mail" forState:UIControlStateNormal];
	[btnMail setTitle:@"Send Mail" forState:UIControlStateSelected];
	[btnMail addTarget:self action:@selector(sendMail) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnMail];
	[btnMail release];
	
	imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60.0, 100.0, 200.0, 200.0)];
	[imgView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:imgView];
	
}

- (void) selectImg {
	
	cameraController = [[UIImagePickerController alloc] init];	
	[cameraController setDelegate:self];
	[cameraController setAllowsEditing:YES];
	[cameraController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
	
	[self presentModalViewController:cameraController animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	
	[picker dismissModalViewControllerAnimated:YES];
	
	UIImage *img = [info objectForKey:@"UIImagePickerControllerEditedImage"];
	[imgView setImage:img];

}

- (void) sendMail {
	
	if (imgView.image == nil) {
		
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:nil
							  message:@"메일로 보낼 이미지를 선택해주세요." 
							  delegate:self 
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else {
		
		NSArray *toArr = [[NSArray alloc] initWithObjects:@"aaaaa@aaa.com", @"bbbb@bbb.net", nil];
		NSArray *ccArr = [[NSArray alloc] initWithObjects:@"ccc@cccc.com", @"dd@dddd.net", @"eeee@eee.co.kr", nil];
		NSArray *bccArr = [[NSArray alloc] initWithObjects:@"fff@fffff.com", nil];
		
		imgData = UIImagePNGRepresentation(imgView.image);  	
		
		controller = [[MFMailComposeViewController alloc] init];
		[controller setMailComposeDelegate:self];
		[controller setToRecipients:toArr];
		[controller setCcRecipients:ccArr];
		[controller setBccRecipients:bccArr];
		[controller setSubject:@"메일의 제목입니다."];
		[controller setMessageBody:@"메일의 내용입니다." isHTML:NO];
		[controller addAttachmentData:imgData mimeType:@"image/png" fileName:@"mailImg"]; 
		[self presentModalViewController:controller animated:YES];
	}
	
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
	[imgView release];
	[cameraController release];
	[controller release];
}


@end
