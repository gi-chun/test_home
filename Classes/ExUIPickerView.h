//
//  ExUIPickerView.h
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExUIPickerView : UIViewController <UIPickerViewDelegate> {
	
	NSMutableArray *pickerArray;
	UIPickerView *picker;
	
	UILabel *result;
}

@end
