    //
//  PlaceMark.m
//  TousLesJours
//
//  Created by dwcomms on 10. 12. 12..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlaceMark.h"


@implementation PlaceMark

@synthesize coordinate;
@synthesize title;
@synthesize currentPoint;

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate {
	coordinate = aCoordinate;
	
	return self;
	
}



@end
