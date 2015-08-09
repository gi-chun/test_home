    //
//  ExCameraAlbum.m
//  Example
//
//  Created by dwcomms on 11. 3. 17..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExCameraAlbum.h"



@implementation ExCameraAlbum


- (void)viewDidLoad {
    [super viewDidLoad];
	
	cameraController = [[UIImagePickerController alloc] init];	
	[cameraController setDelegate:self];
	[cameraController setAllowsEditing:YES];
	[cameraController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
	
	[self presentModalViewController:cameraController animated:YES];
	
	imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60.0, 100.0, 200.0, 200.0)];
	[self.view addSubview:imgView];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:YES];
	
	UIImage *img = [info objectForKey:@"UIImagePickerControllerEditedImage"];
	[imgView setImage:img];

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
}


@end
