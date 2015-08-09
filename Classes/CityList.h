//
//  CityList.h
//  Example
//
//  Created by dwcomms on 11. 1. 3..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface CityList : NSObject {
	
	NSMutableArray *dep0NameArr;
	NSMutableArray *dep1NameArr;
	NSMutableArray *dep2NameArr;

}



@property (nonatomic, retain)  NSMutableArray *dep0NameArr;
@property (nonatomic, retain)  NSMutableArray *dep1NameArr;
@property (nonatomic, retain)  NSMutableArray *dep2NameArr;

- (id) init;

@end
