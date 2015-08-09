    //
//  EXUserDefault.m
//  Example
//
//  Created by dwcomms on 11. 3. 9..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EXUserDefault.h"


@implementation EXUserDefault


- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSMutableArray *dataArr = [[[NSMutableArray alloc] init] autorelease];
	
	
	[dataArr addObject:@"A"];
	[dataArr addObject:@"B"];
	[dataArr addObject:@"C"];
	[dataArr addObject:@"D"];
	[dataArr addObject:@"E"];
	[dataArr addObject:@"F"];
	[dataArr addObject:@"G"];
	
	
	NSUserDefaults *UserDefaults = [NSUserDefaults standardUserDefaults];
	
	[UserDefaults setObject:dataArr forKey:@"SaveData"];
	[UserDefaults synchronize];
	
	
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
