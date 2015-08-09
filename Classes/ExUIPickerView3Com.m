    //
//  ExUIPickerView3Com.m
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUIPickerView3Com.h"


@implementation ExUIPickerView3Com


- (void)viewDidLoad {
    [super viewDidLoad];
	
	cityList = [[CityList alloc] init];
	
	
	nPicker = [[UIPickerView alloc] init];
	[nPicker setDelegate:self];
	[nPicker setFrame:CGRectMake(0.0, 0.0, 320.0, 300.0)];
	[nPicker setShowsSelectionIndicator:YES];
	[self.view addSubview:nPicker];
	
	result = [[UILabel alloc] init];
	[result setFrame:CGRectMake(0.0, 300.0, 320.0, 20.0)];
	[result setBackgroundColor:[UIColor clearColor]];
	[result setTextAlignment:UITextAlignmentCenter];		
	[self.view addSubview:result];
		
	
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	NSLog(@"component : %d", component);
    return 100;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	NSLog(@"numberOfComponentsInPickerView");
	return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	
	if (component == 0) {
		return [cityList.dep0NameArr count];
	}else if (component == 1) {
		return [[cityList.dep1NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] count];
	}else{
		return [[[cityList.dep2NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] objectAtIndex:[nPicker selectedRowInComponent:1]] count];

	}
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	NSLog(@"row : %d", row);
	
	if (component == 0) {
		NSString *tmpStr = [cityList.dep0NameArr objectAtIndex:row];
		return tmpStr;
		
	}else if (component == 1) {
		
		NSString *tmpStr = [[cityList.dep1NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] objectAtIndex:row];
		return tmpStr;
		
	}else{
		
		NSString *tmpStr = [[[cityList.dep2NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] objectAtIndex:[nPicker selectedRowInComponent:1]] objectAtIndex:row];
		return tmpStr;

	}
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	
	if (component == 0) {
		[nPicker selectRow:0 inComponent:1 animated:YES];
		[nPicker selectRow:0 inComponent:2 animated:YES];
		[nPicker reloadComponent:1];
		[nPicker reloadComponent:2];
		
	}else if (component == 1) {
		[nPicker selectRow:0 inComponent:2 animated:YES];
		[nPicker reloadComponent:2];
		
	}
	
	NSString *tmpStr0 = [cityList.dep0NameArr objectAtIndex:row];
	NSString *tmpStr1 = [[cityList.dep1NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] objectAtIndex:[nPicker selectedRowInComponent:1]];
	NSString *tmpStr2 = [[[cityList.dep2NameArr objectAtIndex:[nPicker selectedRowInComponent:0]] objectAtIndex:[nPicker selectedRowInComponent:1]] objectAtIndex:[nPicker selectedRowInComponent:2]];
	
	
	result.text = [NSString stringWithFormat:@"%@ %@ %@", tmpStr0, tmpStr1, tmpStr2];
	
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
	[cityList release];
	[nPicker release];
	[result release];
}


@end
