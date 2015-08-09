    //
//  ExUITextField.m
//  Example
//
//  Created by dwcomms on 11. 3. 28..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITextField.h"


@implementation ExUITextField


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	UITextField *inputText = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30.0)];
	[inputText setBorderStyle:UITextBorderStyleRoundedRect];
	[inputText setKeyboardType:UIKeyboardTypeDefault];
	[inputText setReturnKeyType:UIReturnKeyDefault];
	[self.view addSubview:inputText];
	
	[inputText becomeFirstResponder];
	[inputText release];
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
