//
//  ExUITableViewEdit.h
//  Example
//
//  Created by dwcomms on 11. 3. 11..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExUITableViewEdit : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	
	UITableView *listView;
	NSMutableArray *arr;

}

@end
