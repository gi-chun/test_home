//
//  ExUIPickerView3Com.h
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityList.h"


@interface ExUIPickerView3Com : UIViewController <UIPickerViewDelegate>{
	
	CityList *cityList;

	UIPickerView *nPicker;
	UILabel *result;
}

@end
