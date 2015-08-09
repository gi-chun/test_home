    //
//  ExTabSlidingMenu.m
//  Example
//
//  Created by dwcomms on 11. 3. 16..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExTabSlidingMenu.h"


@implementation ExTabSlidingMenu


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	lbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 160, 160)];
	[lbl setBackgroundColor:[UIColor greenColor]];
	[self.view addSubview:lbl];
	
	slideMenuView = [[UIView alloc] initWithFrame:CGRectMake(250, -200, 70, 250)];
	[slideMenuView setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:slideMenuView];
	
	UIButton *btnRed = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 70, 40)];
	[btnRed setBackgroundColor:[UIColor redColor]];
	[btnRed setTitle:@"red" forState:UIControlStateNormal];
	[btnRed addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnRed];
	[btnRed release];
	
	UIButton *btnBlue = [[UIButton alloc] initWithFrame:CGRectMake(0, 70, 70, 40)];
	[btnBlue setBackgroundColor:[UIColor blueColor]];
	[btnBlue setTitle:@"blue" forState:UIControlStateNormal];
	[btnBlue addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnBlue];
	[btnBlue release];
	
	UIButton *btnBlack = [[UIButton alloc] initWithFrame:CGRectMake(0, 130, 70, 40)];
	[btnBlack setBackgroundColor:[UIColor blackColor]];
	[btnBlack setTitle:@"black" forState:UIControlStateNormal];
	[btnBlack addTarget:self action:@selector(ChangeLabel:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btnBlack];
	[btnBlack release];
		
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 70, 50)];
	[btn setBackgroundColor:[UIColor orangeColor]];
	[btn setTitle:@"OPEN" forState:UIControlStateNormal];
	[btn setTitle:@"CLOSE" forState:UIControlStateSelected];
	[btn setSelected:NO];
	[btn addTarget:self action:@selector(ShowMenu:) forControlEvents:UIControlEventTouchUpInside];
	[slideMenuView addSubview:btn];
	[btn release];
}

- (void) ShowMenu: (UIButton *)sender {
	if (sender.selected) {
		[sender setSelected:NO];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[slideMenuView setFrame:CGRectMake(250, -200, 70, 250)];
		
		[UIView commitAnimations];
	}
	else {
		[sender setSelected:YES];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:0.5];
		
		[slideMenuView setFrame:CGRectMake(250.0, 0.0, 70.0, 250.0)];
		
		[UIView commitAnimations];
	}	
}

- (void) ChangeLabel: (UIButton *)sender {
	
	[lbl setBackgroundColor:sender.backgroundColor];
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[lbl release];
	[slideMenuView release];
}


@end
