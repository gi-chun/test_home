//
//  ExCamera.h
//  Example
//
//  Created by dwcomms on 11. 3. 16..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ExCamera : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	
	UIImagePickerController *cameraController;
	
	UIImageView *imgView;
	
	UIActivityIndicatorView *indicator;

}

@end
           