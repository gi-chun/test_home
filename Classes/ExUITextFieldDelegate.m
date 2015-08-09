    //
//  ExUITextFieldDelegate.m
//  Example
//
//  Created by dwcomms on 11. 3. 28..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITextFieldDelegate.h"


@implementation ExUITextFieldDelegate

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UITextField *inputText = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30.0)];
	[inputText setBorderStyle:UITextBorderStyleRoundedRect];
	[inputText setKeyboardType:UIKeyboardTypeDefault];
	[inputText setReturnKeyType:UIReturnKeyDefault];
	[inputText setDelegate:self];
	[inputText setPlaceholder:@"입력하세요."];
	[inputText setClearButtonMode:UITextFieldViewModeAlways];
	[inputText setAutocorrectionType:UITextAutocorrectionTypeNo];
	[inputText setFont:[UIFont fontWithName:@"HelveticaBold" size:14.0]];
	[self.view addSubview:inputText];
	
	[inputText becomeFirstResponder];
	[inputText release];

}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	
	Log(@"");
	
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	
	Log(@"");
	
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	
	Log(@"");
	
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	
	Log(@"");
	
	return YES;
	
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	
	Log(@"");
	
	return YES;
	
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	
	Log(@"");
	
	return YES;
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {	
	
	Log(@"");
	
	[textField resignFirstResponder];
	
	return YES;
	
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
