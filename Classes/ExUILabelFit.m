    //
//  ExUILabelFit.m
//  Example
//
//  Created by dwcomms on 11. 3. 25..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUILabelFit.h"


@implementation ExUILabelFit 


- (void)viewDidLoad {
    [super viewDidLoad];
	
	{
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5.0, 10.0, 100.0, 40.0)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[btn setTitle:@"TOP" forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(moveTop) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];
		[btn release];
	}
	
	{
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(110.0, 10.0, 100.0, 40.0)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[btn setTitle:@"MIDDLE" forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(moveNormal) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];	
		[btn release];
	}
	
	{
		UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(215.0, 10.0, 100.0, 40.0)];
		[btn setBackgroundColor:[UIColor blackColor]];
		[btn setTitle:@"BOTTOM" forState:UIControlStateNormal];
		[btn addTarget:self action: @selector(moveBottom) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn];	
		[btn release];
	}
	
	lblText = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 80.0, 300.0, 300.0)];
	[lblText setBackgroundColor:[UIColor grayColor]];
	[lblText setText:@"안녕하세요."];
	[self.view addSubview:lblText];
	
}

- (void) moveTop {
	
	[lblText setFrame:CGRectMake(10.0, 80.0, 300.0, 300.0)];
	
	CGSize textSize = [lblText.text 
					   sizeWithFont:lblText.font 
					   constrainedToSize:lblText.frame.size 
					   lineBreakMode:lblText.lineBreakMode
					   ];

	[lblText setFrame:CGRectMake(
								 lblText.frame.origin.x,
								 lblText.frame.origin.y,
								 lblText.frame.size.width,
								 textSize.height
								 )];
	
}

- (void) moveNormal {
	
	[lblText setFrame:CGRectMake(10.0, 80.0, 300.0, 300.0)];
	
}


- (void) moveBottom {
	
	[lblText setFrame:CGRectMake(10.0, 80.0, 300.0, 300.0)];
	
	CGSize textSize = [lblText.text
					   sizeWithFont:lblText.font
					   constrainedToSize:lblText.frame.size
					   lineBreakMode:lblText.lineBreakMode
					   ];

	[lblText setFrame:CGRectMake(
								 lblText.frame.origin.x,
								 (lblText.frame.origin.y + lblText.frame.size.height) - textSize.height,
								 lblText.frame.size.width,
								 textSize.height
								 )];
	
	
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
	[lblText release];

}


@end
