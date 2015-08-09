    //
//  ExUserDefaultSwitch.m
//  Example
//
//  Created by dwcomms on 11. 3. 9..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUserDefaultSwitch.h"


@implementation ExUserDefaultSwitch


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
	UISwitch *Switch = [[UISwitch alloc] init];
	Switch.frame = CGRectMake(30.0, 100.0, 30.0, 30.0);
	[Switch addTarget:self action:@selector(Touch:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:Switch];
	[Switch release];
	
	if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"SwitchOn"] isEqualToString:@"YES"]) {
		
		[Switch setOn:YES];
		
	}
	else if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"SwitchOn"] isEqualToString:@"NO"]) {
		
		[Switch setOn:NO];	
		
	}
	else {
		
		[Switch setOn:YES];
		
	}

	
}

-(void)Touch:(UISwitch *)sender {
	
	if (sender.isOn) {
		
		[[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"SwitchOn"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	else {
		
		[[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"SwitchOn"];
		[[NSUserDefaults standardUserDefaults] synchronize];
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
