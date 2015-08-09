//
//  ExMapAddPin.h
//  Example
//
//  Created by dwcomms on 11. 3. 7..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PlaceMark.h"
#import "ShopDetailView.h"

@interface ExMapAddPin : UIViewController <MKMapViewDelegate> {
	
	MKMapView *myMapView;
	NSMutableArray *storeInfoArr;
	
	ShopDetailView *detailView;

}

@end
