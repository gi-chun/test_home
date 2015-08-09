    //
//  ExTabEffect.m
//  Example
//
//  Created by dwcomms on 11. 1. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExTabEffect.h"


@implementation ExTabEffect




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	

	foodView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 400.0)];
	[foodView setBackgroundColor:[UIColor clearColor]];
	[foodView setAlpha:1.0f];
	[self.view addSubview:foodView];
	
	UILabel *lbFood = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 100.0, 320.0, 100.0)];
	[lbFood setBackgroundColor:[UIColor clearColor]];
	[lbFood setTextAlignment:UITextAlignmentCenter];
	[lbFood setText:@"한식, 중식, 양식"];
	[foodView addSubview:lbFood];
	[lbFood release];
	
	drinkView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 400.0)];
	[drinkView setBackgroundColor:[UIColor clearColor]];	
	[drinkView setAlpha:0.0f];
	[self.view addSubview:drinkView];
	

	UILabel *lbDrink = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 100.0, 320.0, 100.0)];
	[lbDrink setBackgroundColor:[UIColor clearColor]];
	[lbDrink setTextAlignment:UITextAlignmentCenter];	
	[lbDrink setText:@"커피, 홍차, 녹차"];	
	[drinkView addSubview:lbDrink];
	[lbDrink release];
	
	
	UIButton *btnFood = [[UIButton alloc] initWithFrame:CGRectMake(40.0, 40.0, 100.0, 30.0)];
	[btnFood setTitle:@"음식" forState:UIControlStateNormal];
	[btnFood setBackgroundColor:[UIColor grayColor]];
	[btnFood addTarget:self action:@selector(Food) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnFood];
	[btnFood release];
	
	
	
	UIButton *btnDrink = [[UIButton alloc] initWithFrame:CGRectMake(180.0, 40.0, 100.0, 30.0)];
	[btnDrink setTitle:@"음료" forState:UIControlStateNormal];
	[btnDrink setBackgroundColor:[UIColor grayColor]];
	[btnDrink addTarget:self action:@selector(Drink) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnDrink];
	[btnDrink release];
	
	
	lbInfo = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 220.0, 320.0, 100.0)];
	[lbInfo setBackgroundColor:[UIColor clearColor]];
	[lbInfo setTextAlignment:UITextAlignmentCenter];	
	[lbInfo setText:@"음식/음료 버튼을 선택해주세요."];	
	[self.view addSubview:lbInfo];
	
	
	
}

- (void) Food {
	
	[foodView setAlpha:1.0f];
	[drinkView setAlpha:0.0f];
	[lbInfo setText:@"음식 버튼을 선택하셨습니다."];
	
}

- (void) Drink {
	
	[foodView setAlpha:0.0f];
	[drinkView setAlpha:1.0f];
	[lbInfo setText:@"음료 버튼을 선택하셨습니다."];
	
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
	[foodView release];
	[drinkView release];
	[lbInfo release];
}


@end
