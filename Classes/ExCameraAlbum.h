//
//  ExCameraAlbum.h
//  Example
//
//  Created by dwcomms on 11. 3. 17..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExCameraAlbum : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	
	UIImagePickerController *cameraController;
	
	UIImageView *imgView;

}

@end
