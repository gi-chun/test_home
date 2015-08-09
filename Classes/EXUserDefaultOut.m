    //
//  EXUserDefaultOut.m
//  Example
//
//  Created by dwcomms on 11. 3. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EXUserDefaultOut.h"


@implementation EXUserDefaultOut



- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSArray *dataArr = [[[NSArray alloc] init] autorelease];
	
	NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
	

	dataArr = [UserDefaults objectForKey:@"SaveData"];
	
	NSLog(@"dataArr : %@", dataArr);
	
	
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
