	//
//  CityList.m
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "CityList.h"




@implementation CityList

@synthesize dep0NameArr;
@synthesize dep1NameArr;
@synthesize dep2NameArr;


- (id)init {
	
	dep0NameArr = [[NSMutableArray alloc] init];
	[dep0NameArr addObject:@"수도권"];
	[dep0NameArr addObject:@"경상권"];
	[dep0NameArr addObject:@"전라권"];
	[dep0NameArr addObject:@"충청권"];
	
	NSMutableArray *b0 = [[NSMutableArray alloc] init];
	[b0 addObject:@"강남"];
	[b0 addObject:@"강북"];
	[b0 addObject:@"경기"];
	[b0 addObject:@"인천"];
	
	NSMutableArray *b1 = [[NSMutableArray alloc] init];
	[b1 addObject:@"경북"];		
	[b1 addObject:@"경남"];	
	[b1 addObject:@"부산"];	
	[b1 addObject:@"대구"];	
	
	
	NSMutableArray *b2 = [[NSMutableArray alloc] init];
	[b2 addObject:@"대전"];
	[b2 addObject:@"광주"];
	[b2 addObject:@"전북"];
	[b2 addObject:@"전남"];
	
	
	NSMutableArray *b3 = [[NSMutableArray alloc] init];
	[b3 addObject:@"충북"];
	[b3 addObject:@"충남"];
	
	dep1NameArr = [[NSMutableArray alloc] initWithObjects:b0, b1, b2, b3, nil];
	
	
	NSMutableArray *d00 = [[NSMutableArray alloc] initWithObjects:@"역삼", @"강남", @"반포", @"사당", nil];//강남
	NSMutableArray *d01 = [[NSMutableArray alloc] initWithObjects:@"노원", @"용산", @"종로", nil];//강북
	NSMutableArray *d02 = [[NSMutableArray alloc] initWithObjects:@"부천", @"과천", @"광명", @"의정부", nil];//경기
	NSMutableArray *d03 = [[NSMutableArray alloc] initWithObjects:@"부평", @"간석", @"주안", nil];//인천
	
	NSMutableArray *d0 = [[NSMutableArray alloc] initWithObjects:d00, d01, d02, d03, nil];//수도권
	
	
	NSMutableArray *d10 = [[NSMutableArray alloc] initWithObjects:@"안동", @"경주", @"구미", @"상주", nil];//경북
	NSMutableArray *d11 = [[NSMutableArray alloc] initWithObjects:@"밀양", @"마산", @"김해", nil];//경남
	NSMutableArray *d12 = [[NSMutableArray alloc] initWithObjects:@"연산", @"서면", @"남포", @"동래", nil];//부산
	NSMutableArray *d13 = [[NSMutableArray alloc] initWithObjects:@"두류", @"명덕", @"신천", nil];//대구
	
	NSMutableArray *d1 = [[NSMutableArray alloc] initWithObjects:d10, d11, d12, d13, nil];//경상권
	
	NSMutableArray *d20 = [[NSMutableArray alloc] initWithObjects:@"월평", @"갈마", @"용문", nil];//대전
	NSMutableArray *d21 = [[NSMutableArray alloc] initWithObjects:@"운천", @"쌍촌", @"도산", @"소태", nil];//광주
	NSMutableArray *d22 = [[NSMutableArray alloc] initWithObjects:@"전주", @"김제", @"남원", @"순창", @"고창", nil];//전북
	NSMutableArray *d23 = [[NSMutableArray alloc] initWithObjects:@"목포", @"여수", @"나주", @"무안", @"완도", nil];//전남
	
	NSMutableArray *d2 = [[NSMutableArray alloc] initWithObjects:d20, d21, d22, d23, nil];//전라권
	
	NSMutableArray *d30 = [[NSMutableArray alloc] initWithObjects:@"청주", @"옥천", @"제천", @"단양", nil];//충북
	NSMutableArray *d31 = [[NSMutableArray alloc] initWithObjects:@"천안", @"논산", @"부여", @"아산", nil];//충남
	
	NSMutableArray *d3 = [[NSMutableArray alloc] initWithObjects:d30, d31, nil];//충청권

	dep2NameArr = [[NSMutableArray alloc] initWithObjects:d0, d1, d2, d3, nil];
	
	
	return self;
}




@end
