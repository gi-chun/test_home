    //
//  EXUIPickerViewYMD.m
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EXUIPickerViewYMD.h"


@implementation EXUIPickerViewYMD

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	UIDatePicker *picker = [[UIDatePicker alloc] init];
	[picker setDatePickerMode:UIDatePickerModeDate];
	[picker setFrame:CGRectMake(0.0, 0.0, 320.0, 50.0)];
	[picker addTarget:self action:@selector(Date:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:picker];
	[picker release];
}

- (void) Date:(UIDatePicker *)sender {
	
	NSDate *selectDate = sender.date;
	
	NSLog(@"selectDate : %@", selectDate);
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
