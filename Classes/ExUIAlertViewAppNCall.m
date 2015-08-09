    //
//  ExUIAlertViewAppNCall.m
//  Example
//
//  Created by dwcomms on 11. 3. 11..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIAlertViewAppNCall.h"


@implementation ExUIAlertViewAppNCall

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100.0, 40.0, 120.0, 40.0)];
	[btn setTitle:@"APP N CALL" forState:UIControlStateNormal];
	[btn setBackgroundColor:[UIColor blackColor]];
	[btn addTarget:self action:@selector(Touch) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	[btn release];
	
	
}

-(void) Touch {
	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"알림" 
						  message:@"APP버튼을 누르시면 앱이 실행되며 존재하지 않을 경우\n앱스토어로 바로 연결됩니다.\nCALL 버튼을 누르시면 전화 연결이 가능하며 통화료가 부과됩니다." 
						  delegate:self 
						  cancelButtonTitle:@"Cancel"
						  otherButtonTitles:@"APP", @"CALL", nil];
	[alert show];
	[alert release];
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"button Index :%d", buttonIndex);
	
	if (buttonIndex == 1) {		
		//APP
		
		NSURL* url = [NSURL URLWithString:@"MYACCOUNT://"];
		
		if([[UIApplication sharedApplication] canOpenURL:url]) {
			
			[[UIApplication sharedApplication] openURL:url];
			
						
		}else {
			
			url = [NSURL URLWithString:@"http://itunes.apple.com/kr/app/id362811160?mt=8"];
			[[UIApplication sharedApplication] openURL:url];
			
		}
		
	}
	else if (buttonIndex == 2) {
		//CALL
		NSURL* url = [NSURL URLWithString:@"tel:1111-0000"];
		[[UIApplication sharedApplication] openURL:url];
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