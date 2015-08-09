    //
//  ExUITableViewMore.m
//  Example
//
//  Created by dwcomms on 11. 1. 20..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITableViewMore.h"


@implementation ExUITableViewMore


- (void)viewDidLoad {
    [super viewDidLoad];
	
	table = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 414.0)];
	[table setBackgroundColor:[UIColor clearColor]];
	[table setDelegate:self];
	[table setDataSource:self];
	[table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[table setRowHeight:50];
	[self.view addSubview:table];
	
	dataNum = 11;
	hasMore = YES;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (dataNum == 0) {
		return [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
	}
	else {
		UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
		
		[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
		
		
		UILabel *label;
		NSInteger row;
		
		
		if (hasMore && indexPath.row == (dataNum-1)) {			
			
			[cell setBackgroundColor:[UIColor redColor]];
			
			label = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 10.0, 320.0, 40.0)] autorelease];
			[label setBackgroundColor:[UIColor clearColor]];
			[label setTextAlignment:UITextAlignmentCenter];
			[label setFont:[UIFont systemFontOfSize:20.0]];
			[label setText:@"더보기"];
			[cell.contentView addSubview:label];
			
		}
		else {
			
			row = indexPath.row;
			
			label = [[[UILabel alloc] initWithFrame:CGRectMake(30.0, 0.0, 290.0, 50.0)] autorelease];
			[label setBackgroundColor:[UIColor clearColor]];
			[label setFont:[UIFont systemFontOfSize:15.0]];
			[label setTextAlignment:UITextAlignmentLeft];
			[label setText:[NSString stringWithFormat:@"row : %d", indexPath.row]];
			[cell.contentView addSubview:label];
			
		}
		return cell;
	}
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return dataNum;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (hasMore && indexPath.row == (dataNum-1)) {
		dataNum += 10;
		
		if (dataNum == 31) {
			dataNum = 30;
			hasMore = FALSE;
		}

		[table reloadData];
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
	[table release];
}


@end
