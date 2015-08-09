

#import "ExRotate.h"


@implementation ExRotate

- (void)viewDidLoad {
    [super viewDidLoad];
	
	lblTop = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, 100.0, 280.0, 20.0)] autorelease];
	[lblTop setText:@"Top"];
	[lblTop setTextColor:[UIColor whiteColor]];
	[lblTop setTextAlignment:UITextAlignmentCenter];
	[lblTop setBackgroundColor:[UIColor blackColor]];
	[self.view addSubview:lblTop];
	
	lblBottom = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, 200.0, 280.0, 20.0)] autorelease];
	[lblBottom setText:@"Bottom"];
	[lblBottom setTextColor:[UIColor whiteColor]];
	[lblBottom setTextAlignment:UITextAlignmentCenter];
	[lblBottom setBackgroundColor:[UIColor blackColor]];
	[self.view addSubview:lblBottom];
	

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	[self viewWillRotate:[UIDevice currentDevice].orientation];
    return YES;
}

- (void) viewWillRotate:(UIInterfaceOrientation)toInterfaceOrientation {
	
	
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		
		NSLog(@"landscape");
		
		[lblTop setFrame:CGRectMake(30.0, 200.0, 200.0, 20.0)];
		[lblBottom setFrame:CGRectMake(260.0, 200.0, 200.0, 20.0)];
		
	}
	
	else {
		NSLog(@"nonlandscape");
		
		[lblTop setFrame:CGRectMake(20.0, 100.0, 280.0, 20.0)];
		[lblBottom setFrame:CGRectMake(20.0, 200.0, 280.0, 20.0)];
		
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
	[lblTop release];
	[lblBottom release];
}


@end
