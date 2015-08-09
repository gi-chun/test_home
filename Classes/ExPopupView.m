    //
//  ExPopupView.m
//  Example
//
//  Created by dwcomms on 11. 1. 21..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExPopupView.h"


@implementation ExPopupView


- (void)viewDidLoad {
    [super viewDidLoad];
	

	
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(130.0, 40.0, 60.0, 40.0)];
	[btn setTag:1];
	[btn setTitle:@"Touch!" forState:UIControlStateNormal];
	[btn setBackgroundColor:[UIColor redColor]];
	[btn addTarget:self action:@selector(Touch:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	[btn release];
	
	popUp = [[PopUp alloc] init];
	[popUp.view setFrame:CGRectMake(10.0, 40.0, 300.0, 450.0)];
	[popUp.view setAlpha:0.0f];
	[self.view addSubview:popUp.view];
	
}

- (void) Touch:(id)sender {
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:popUp.view cache:NO];
	[UIView setAnimationDuration:0.75];
	[popUp.view setAlpha:1.0f];
	[UIView commitAnimations];
	


	
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[popUp release];
	
}


@end
