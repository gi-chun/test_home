    //
//  ExUIPickerView.m
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIPickerView.h"


@implementation ExUIPickerView

- (void)viewDidLoad {
    [super viewDidLoad];
	
	pickerArray = [NSMutableArray new];
	[pickerArray addObject:@"첫번째"];
	[pickerArray addObject:@"두번째"];
	[pickerArray addObject:@"세번째"];
	[pickerArray addObject:@"네번째"];
	[pickerArray addObject:@"다섯번째"];	
	
	
	picker = [[UIPickerView alloc] init];
	[picker setDelegate:self];
	[picker setFrame:CGRectMake(0.0, 0.0, 320.0, 300.0)];
	//picker.showsSelectionIndicator = YES;
	[self.view addSubview:picker];
	
	
	result = [[UILabel alloc] init];
	[result setFrame:CGRectMake(0.0, 300.0, 320.0, 20.0)];
	[result setBackgroundColor:[UIColor clearColor]];
	[result setTextAlignment:UITextAlignmentCenter];		
	[self.view addSubview:result];
	
	
}

- (void) viewWillAppear:(BOOL)animated {
	
	[picker selectRow:3 inComponent:0 animated:YES];
	[result setText:[pickerArray objectAtIndex:3]];
	
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

	return 1;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {

    return 200;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
	return 80;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	
	return [pickerArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	
	NSString *tmpStr = [pickerArray objectAtIndex:row];
	
	return tmpStr;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	NSLog(@"select");
	
	[result setText:[pickerArray objectAtIndex:row]];

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
	

	[picker release];
	[result release];
}


@end
