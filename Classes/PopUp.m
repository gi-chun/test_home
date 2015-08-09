    //
//  PopUp.m
//  Example
//
//  Created by dwcomms on 11. 1. 21..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PopUp.h"


@implementation PopUp


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	{
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 40.0)];
		[label setBackgroundColor:[UIColor clearColor]];
		[label setTextAlignment:UITextAlignmentCenter];
		[label setText:@"* pop up window *"];
		[self.view addSubview:label];
		[label release];
		
	}	
	
	{
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 50.0, 270.0, 150.0)];
		[label setBackgroundColor:[UIColor clearColor]];
		[label setTextAlignment:UITextAlignmentCenter];
		[label setFont:[UIFont systemFontOfSize:13.0f]];
		[label setNumberOfLines:0];
		[label setText:@"음소거가 On 상태일 경우에는 이 애플리케이션에서 나오는 효과음과 배경음이 모두 음소거 상태가 됩니다. Off 상태일 경우에는 모든 배경음과 효과음을 들으실 수 있습니다. 다만 휴대폰이 진동 모드일 경우에는 음소거가 Off 로 되어 있어도 배경음과 효과음을 들으실 수 없습니다."];
		[self.view addSubview:label];
		[label release];
	}
	
	{
		UIButton *btnClose = [[UIButton alloc] initWithFrame:CGRectMake(120.0, 250.0, 60.0, 40.0)];
		[btnClose setBackgroundColor:[UIColor whiteColor]];
		[btnClose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[btnClose setTitle:@"Close" forState:UIControlStateNormal];
		[btnClose addTarget:self action:@selector(Touch) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btnClose];
		[btnClose release];
	}
		
}

- (void) Touch {
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
	[UIView setAnimationDuration:0.75];
	[self.view setAlpha:0.0f];
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
}


@end
