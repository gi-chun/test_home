    //
//  ExUITableView.m
//  Example
//
//  Created by dwcomms on 11. 1. 4..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITableView.h"


@implementation ExUITableView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	data = [NSMutableArray new];
	
	[data addObject:@"첫번째"];
	[data addObject:@"두번째"];
	[data addObject:@"세번째"];
	[data addObject:@"네번째"];
	[data addObject:@"다섯번째"];
	[data addObject:@"여섯번째"];
	[data addObject:@"일곱번째"];
	[data addObject:@"여덟번째"];
	[data addObject:@"아홉번째"];
	[data addObject:@"열번째"];
	
	
	
	TableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 416.0) style:UITableViewStylePlain];
	[TableView setRowHeight:50];
	[TableView setDataSource:self];
	[TableView setDelegate:self];
	[TableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[TableView setSeparatorColor:[UIColor grayColor]];
	[self.view addSubview:TableView];
	
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	
	return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell setShowsReorderControl:NO];
    /*
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    [bgView setBackgroundColor:[UIColor redColor]];
    
    [cell setSelectedBackgroundView:bgView];
    */
    //cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    
    /*
	NSString *str = [NSMutableDictionary new];
	
	str = [data objectAtIndex:indexPath.row];
	NSLog(@"%@", str);
	
	
	{
		UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 300.0, 18.0)] autorelease];
		[Label setBackgroundColor:[UIColor clearColor]];
		[Label setNumberOfLines:1];
		[Label setFont:[UIFont systemFontOfSize:14]];
		[Label setText:str];
		[cell.contentView addSubview:Label];
	}
	*/
	return cell;
}




- (void)didReceiveMemoryWarning {
	
    [super didReceiveMemoryWarning];

}

- (void)viewDidUnload {
    [super viewDidUnload];

}


- (void)dealloc {
    [super dealloc];
	[data release];
	[TableView release];
	
	
}


@end
