    //
//  ExUITableViewDetail.m
//  Example
//
//  Created by dwcomms on 11. 1. 14..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExUITableViewDetail.h"


@implementation ExUITableViewDetail

- (void)viewDidLoad {
    [super viewDidLoad];
	
	data = [NSMutableArray new];
	
	{
		NSMutableDictionary *Data = [NSMutableDictionary new];
		[Data setObject:@"15일 오전 2시부터 오전 5시까지 애플리케이션 서버 점검이 있습니다. 이용에 차질 없으시길 바랍니다." forKey:@"text"];
		[Data setObject:@"2010.01.11" forKey:@"date"];
		[Data setObject:@"공지" forKey:@"category"];
		
		[data addObject:Data];
		
	}
	
	{
		NSMutableDictionary *Data = [NSMutableDictionary new];
		[Data setObject:@"창사 10주년 기념 이벤트 안내입니다. 지금까지 저희 xx전자를 사랑해주신 여러분을 위해 총 1억원의 경품행사를 진행합니다. 많은 참여 부탁드립니다." forKey:@"text"];
		[Data setObject:@"2010.01.04" forKey:@"date"];
		[Data setObject:@"이벤트" forKey:@"category"];
		
		[data addObject:Data];
		
	}
	
	{
		NSMutableDictionary *Data = [NSMutableDictionary new];
		[Data setObject:@"새해맞이 이벤트 안내입니다. 아래 번호로 문자를 보내주시면 추첨을 통해 총 10분에게 iPad를 쏩니다! xx-xxxx-xxxx" forKey:@"text"];
		[Data setObject:@"2010.01.01" forKey:@"date"];
		[Data setObject:@"이벤트" forKey:@"category"];
		
		[data addObject:Data];
		
	}
	
	{
		NSMutableDictionary *Data = [NSMutableDictionary new];
		[Data setObject:@"새해 복 많이 받으세요! 항상 좋은 일만 가득하시길 바랍니다." forKey:@"text"];
		[Data setObject:@"2010.01.01" forKey:@"date"];
		[Data setObject:@"공지" forKey:@"category"];
		
		[data addObject:Data];
		
	}
	
	
	
	TableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 10.0, 320.0, 360.0) style:UITableViewStylePlain];
	[TableView setDelegate:self];
	[TableView setRowHeight:60.0];
	[TableView setDataSource:self];
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
	
	if ([data count] == 0) 
		return [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
	else {
		
		UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
		
		NSMutableDictionary *Data = [NSMutableDictionary new];
		
		Data = [data objectAtIndex:indexPath.row];
		
		
		{
			UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 7.0, 300.0, 18.0)] autorelease];
			[Label setBackgroundColor:[UIColor clearColor]];
			[Label setNumberOfLines:1];
			[Label setFont:[UIFont systemFontOfSize:14]];
			[Label setText:[NSString stringWithFormat:@"[%@] %@", [Data objectForKey:@"category"], [Data objectForKey:@"date"]]];
			[cell.contentView addSubview:Label];
			[Label release];
		
		}
		
		{
			UILabel *Label = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 28.0, 300.0, 18.0)] autorelease];
			[Label setBackgroundColor:[UIColor clearColor]];
			[Label setNumberOfLines:1];
			[Label setFont:[UIFont systemFontOfSize:13]];
			[Label setText:[Data objectForKey:@"text"]];
			[cell.contentView addSubview:Label];
			[Label release];
			
		}
		
		return cell;
		
	}
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath{
	
	NSLog(@"");
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	CellDetail *v = [[CellDetail alloc] init];
	[v setData:[data objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:v animated:YES];
	[v release];
	
	
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

