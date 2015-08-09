    //
//  ExUIAlertView.m
//  Example
//
//  Created by dwcomms on 11. 1. 24..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIAlertView.h"


@implementation ExUIAlertView



- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(130.0, 40.0, 60.0, 40.0)];
	[btn setTitle:@"Back" forState:UIControlStateNormal];
	[btn setBackgroundColor:[UIColor blackColor]];
	[btn addTarget:self action:@selector(Touch) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	[btn release];
	
}

-(void) Touch {
	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:nil 
						  message:@"이전 화면으로 이동하시겠습니까?" 
						  delegate:self 
						  cancelButtonTitle:@"NO" 
						  otherButtonTitles:@"YES",nil];
	[alert show];
	[alert release];
	
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	if (buttonIndex == 1) {
		[self.navigationController popViewControllerAnimated:YES];
	}
	
}



- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    

}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
}


@end
