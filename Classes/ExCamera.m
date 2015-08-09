    //
//  ExCamera.m
//  Example
//
//  Created by dwcomms on 11. 3. 16..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExCamera.h"


@implementation ExCamera




- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor blackColor];
	
	cameraController = [[UIImagePickerController alloc] init];	
	[cameraController setDelegate:self];
	[cameraController setAllowsEditing:YES];
	[cameraController setSourceType:UIImagePickerControllerSourceTypeCamera];	
	[cameraController setShowsCameraControls:YES];
	
	[self presentModalViewController:cameraController animated:YES];	
	
	imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60.0, 100.0, 200.0, 200.0)];
	[self.view addSubview:imgView];
	
	indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145.0, 180.0, 30.0, 30.0)];
	[indicator setHidesWhenStopped:YES];
	[self.view addSubview:indicator];
	
	
	
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	
	[picker dismissModalViewControllerAnimated:YES];
	
	[indicator startAnimating];
	
    UIImage *img = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
	UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error != NULL) {
		// Show error message...
		Log(@"save error");
    } else {
		Log(@"save success");
	}
	
	[imgView setImage:image];
	
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
	[cameraController release];
	
	[imgView release];
	
	[indicator release];
	
}


@end
