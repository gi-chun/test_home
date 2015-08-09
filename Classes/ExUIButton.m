    //
//  ExUIButton.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIButton.h"


@implementation ExUIButton


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	{

		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100.0, 100.0, 60.0, 40.0)];
		btn.backgroundColor = [UIColor blueColor];
		[btn addTarget:self action: @selector(btn:) forControlEvents:UIControlEventTouchUpInside];
		[btn setTag:0];
		[self.view addSubview:btn];	
		[btn release];
	}
	
	{
		UIImage *img = [UIImage imageNamed:@"gnb_app_on.png"];
		
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100.0, 200.0, 60.0, 40.0)];
		//[btn setImage:imgOff forState:UIControlStateNormal];
    	[btn setBackgroundColor:[UIColor redColor]];
		[btn setImage:img forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(btn:) forControlEvents:UIControlEventTouchUpInside];
		[btn setTag:1];
		[self.view addSubview:btn];
		[btn release];
	}
	
	{
		UIImage *imgOff = [UIImage imageNamed:@"gnb_app_off.png"];
		UIImage *imgOn = [UIImage imageNamed:@"gnb_app_on.png"];
		UIImage *imgOver = [UIImage imageNamed:@"gnb_app_up.png"];
		
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100.0, 300.0, imgOff.size.width, imgOff.size.height)];
		[btn setImage:imgOff forState:UIControlStateNormal];
		[btn setImage:imgOn forState:UIControlStateSelected];
		[btn setImage:imgOver forState:UIControlStateHighlighted];
		[btn addTarget:self action: @selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];	
		[btn release];
	}
	
}

- (void) btnSelect:(UIButton *)sender {
	NSLog(@"Touch");
	
	if (sender.selected) {
		[sender setSelected:FALSE];
	}
	else {
		[sender setSelected:TRUE];
	}
	
}

- (void) btn:(id)sender {
	
	switch ([sender tag]) {
		case 0:
			NSLog(@"0");
			break;
		case 1:
			NSLog(@"1");
			break;
	}
	
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
