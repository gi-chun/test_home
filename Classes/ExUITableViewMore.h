//
//  ExUITableViewMore.h
//  Example
//
//  Created by dwcomms on 11. 1. 20..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExUITableViewMore : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	
	UITableView		*table;
	NSInteger		dataNum;
	BOOL			hasMore;
	
}

@end
