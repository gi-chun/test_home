//
//  ExUITableViewDetail.h
//  Example
//
//  Created by dwcomms on 11. 1. 14..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDetail.h"


@interface ExUITableViewDetail : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	
	UITableView *TableView;
	NSMutableArray *data;


}

@end
