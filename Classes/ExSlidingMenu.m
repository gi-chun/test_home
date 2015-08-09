    //
//  ExSlidingMenu.m
//  Example
//
//  Created by dwcomms on 11. 3. 16..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExSlidingMenu.h"


@implementation ExSlidingMenu

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	lbl = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 80.0, 200.0, 200.0)];
	[lbl setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:lbl];
	
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
	[btn setBackgroundColor:[UIColor clearColor]];
	[btn setSelected:NO];
	[btn addTarget:self action:@selector(ShowMenu:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	[btn release];
	
	
	slideMenuView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 480.0, 320.0, 100.0)];
	[slideMenuView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:slideMenuView];	
	
	UIButton *btnRed = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 35.0, 80.0, 30.0)];
	[btnRed setBackgroundColor:[UIColor redColor]];
	[btnRed setTitle:@"red" forState:UIControlStateNormal];
	[btnRed addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnRed];
	[btnRed release];
	
	UIButton *btnBlue = [[UIButton alloc] initWithFrame:CGRectMake(120.0, 35.0, 80.0, 30.0)];
	[btnBlue setBackgroundColor:[UIColor blueColor]];
	[btnBlue setTitle:@"blue" forState:UIControlStateNormal];
	[btnBlue addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnBlue];
	[btnBlue release];
	
	UIButton *btnBlack = [[UIButton alloc] initWithFrame:CGRectMake(220.0, 35.0, 80.0, 30.0)];
	[btnBlack setBackgroundColor:[UIColor blackColor]];
	[btnBlack setTitle:@"black" forState:UIControlStateNormal];
	[btnBlack addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnBlack];
	[btnBlack release];
	
}

- (void) ShowMenu: (UIButton *)sender {
	if (sender.selected) {
		[sender setSelected:NO];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[slideMenuView setFrame:CGRectMake(0.0, 320.0, 320.0, 100.0)];
		
		[UIView commitAnimations];
	}
	else {
		[sender setSelected:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[slideMenuView setFrame:CGRectMake(0.0, 480.0, 320.0, 100.0)];
		
		[UIView commitAnimations];
	}	
}

- (void) ChangeLabel: (UIButton *)sender {
	
	[lbl setBackgroundColor:sender.backgroundColor];
	
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
	[lbl release];
	[slideMenuView release];
}


@end
