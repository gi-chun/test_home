//
//  PlaceMark.h
//  TousLesJours
//
//  Created by dwcomms on 10. 12. 12..
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface PlaceMark : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	
	MKPlacemark *_placemark;
	
	int currentPoint;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) int currentPoint;

- (id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end
