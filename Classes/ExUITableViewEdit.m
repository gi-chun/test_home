    //
//  ExUITableViewEdit.m
//  Example
//
//  Created by dwcomms on 11. 3. 11..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITableViewEdit.h"


@implementation ExUITableViewEdit


- (void)viewDidLoad {
    [super viewDidLoad];
	
	arr = [NSMutableArray new];
	
	for (int i = 0; i < 10; ++i) {
		[arr addObject:[NSString stringWithFormat:@"%d번째 데이터", i]];
	}
	
	UIButton *btnEdit = [[UIButton alloc] initWithFrame:CGRectMake(110.0, 20.0, 100.0, 40.0)];
	[btnEdit setBackgroundColor:[UIColor blackColor]];
	[btnEdit setTitle:@"수정하기" forState:UIControlStateNormal];
	[btnEdit setTitle:@"수정중" forState:UIControlStateSelected];
	[btnEdit addTarget:self action:@selector(Edit:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnEdit];
	
	listView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 70.0, 320.0, 350.0)];
	[listView setBackgroundColor:[UIColor grayColor]];
	[listView setRowHeight:50];
	[listView setDataSource:self];
	[listView setDelegate:self];
	[self.view addSubview:listView];	
	
}

- (void) Edit: (UIButton *)btn {
	
	if(self.editing)
	{
		[super setEditing:NO animated:YES];
		[listView setEditing:NO animated:YES];
		[btn setSelected:NO];

		
	}
	else
	{
		[super setEditing:YES animated:YES];
		[listView setEditing:YES animated:YES];	
		[btn setSelected:YES];
		
	}
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return YES;
}


- (void)tableView:(UITableView *)tableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		NSMutableArray *delArray = [[NSMutableArray alloc]init];		
		[delArray addObject:indexPath];
		
		[arr removeObjectAtIndex:indexPath.row];
		
		[tableView deleteRowsAtIndexPaths:delArray withRowAnimation:UITableViewRowAnimationRight];
		

	} 
}

- (BOOL)tableView:(UITableView *)tableView   canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView  moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath {
	
	
	NSString *moveObj = [[arr objectAtIndex:fromIndexPath.row] retain];
	
	[arr removeObject:moveObj];
	[arr insertObject:moveObj atIndex:toIndexPath.row];
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [arr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	
	UILabel *LabelInfo = [[[UILabel alloc] initWithFrame:CGRectMake(20.0, 0.0, 300.0, 40.0)] autorelease];
	[LabelInfo setBackgroundColor:[UIColor clearColor]];
	[LabelInfo setNumberOfLines:1];
	[LabelInfo setFont:[UIFont systemFontOfSize:14]];
	[LabelInfo setText:[arr objectAtIndex:indexPath.row]];
	[cell.contentView addSubview:LabelInfo];
	
	return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	
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
	[arr release];
	[listView release];
}


@end
