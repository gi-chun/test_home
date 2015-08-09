//
//  ExUITableView.h
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExUITableView : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	
	UITableView *TableView;
	NSMutableArray *data;

}

@end
