    //
//  CellDetail.m
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CellDetail.h"


@implementation CellDetail
@synthesize Data;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	float posY = 20.0;
	
	
	NSLog(@"1");
	{
		UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(30.0, posY +10.0, 260.0, 18.0)] autorelease];
		[Label setBackgroundColor:[UIColor clearColor]];
		[Label setLineBreakMode:UILineBreakModeClip];
		[Label setNumberOfLines:1];
		[Label setFont:[UIFont systemFontOfSize:14.0]];
		[Label setText:[NSString stringWithFormat:@"[%@] %@", [Data objectForKey:@"category"], [Data objectForKey:@"date"]]];
		[self.view addSubview:Label];
		[Label release];
	}
	NSLog(@"2");
	
	{
		UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, posY +40.0, 280.0, 1.0)] autorelease];
		[Label setBackgroundColor:RGB(130.0, 130.0, 130.0)];
		[self.view addSubview:Label];
		[Label release];
	}	
	
	NSLog(@"3");
	{

		UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, posY +15.0, 280.0, 150.0)] autorelease];
		[Label setBackgroundColor:[UIColor clearColor]];
		[Label setLineBreakMode:UILineBreakModeClip];
		[Label setNumberOfLines:10];
		[Label setFont:[UIFont boldSystemFontOfSize:15.0]];
		[Label setText:[Data objectForKey:@"text"]];
		[self.view addSubview:Label];
		[Label release];
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
