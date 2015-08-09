//
//  ExSendMailWithImg.h
//  Example
//
//  Created by dwcomms on 11. 3. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ExSendMailWithImg : UIViewController <MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{

	UIImagePickerController *cameraController;
	UIImageView *imgView;
	
	MFMailComposeViewController* controller;
	
	NSData *imgData;
}

@end
