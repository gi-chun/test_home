    //
//  ExMapAddPin.m
//  Example
//
//  Created by dwcomms on 11. 3. 7..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExMapAddPin.h"


@implementation ExMapAddPin

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	myMapView = [MKMapView new];
	CGRect f = self.view.frame;
	f.origin.y -= 20;
	[myMapView setFrame:f];
	[myMapView setDelegate:self];
	[myMapView setShowsUserLocation:TRUE];
	[myMapView setMapType:MKMapTypeStandard];
	[myMapView.userLocation setTitle:@"현재위치"];		
	[self.view addSubview:myMapView];
	
	storeInfoArr = [NSMutableArray new];
	
	for (int i = 0; i < 6; ++i) {
		NSMutableDictionary *dic = [NSMutableDictionary new];
		float latitude = 37.528121 + i*0.0005;
		float longitude = 126.917934 + i*0.0005;
		
		[dic setObject:[NSString stringWithFormat:@"%f", latitude] forKey:@"LATITUDE"];
		[dic setObject:[NSString stringWithFormat:@"%f", longitude] forKey:@"LONGITUDE"];
		[dic setObject:[NSString stringWithFormat:@"%d 번째 장소입니다.", i] forKey:@"NAME"];
		
		[storeInfoArr addObject:dic];
	}
	
	for (int i = 0; i < [storeInfoArr count]; i++) {
		NSDictionary *item = [storeInfoArr objectAtIndex:i];
		
		CLLocationCoordinate2D curLocation;
		curLocation.latitude= [[item objectForKey:@"LATITUDE"]  floatValue];  
		curLocation.longitude= [[item objectForKey:@"LONGITUDE"] floatValue];
		PlaceMark *shopPlaceMark = [[PlaceMark alloc] initWithCoordinate:curLocation];
		
		[shopPlaceMark setTitle:[item objectForKey:@"NAME"]];
		[shopPlaceMark setCurrentPoint:i];
		
		[myMapView addAnnotation:shopPlaceMark];
		[shopPlaceMark release];
		
	}
	
    CLLocationCoordinate2D location2D;
    
	float latitude = 37.528121;
    float longitude = 126.917934;
    
    location2D.latitude = latitude;
    location2D.longitude = longitude;
	
	MKCoordinateRegion region;
	region.center = location2D;
	
	MKCoordinateSpan span;
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	region.span=span;
	
	[myMapView setRegion:region animated:TRUE];
	[myMapView regionThatFits:region];
}

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id )annotation {
	
	NSLog(@"pin");
	
	
	if (annotation != myMapView.userLocation){
		
		UIImage *img = [UIImage imageNamed:@"toree_icon.png"];
		
		MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ShopLoc"];
		[annotationView setAnnotation:annotation];
		[annotationView setImage:img];		
		

		
		UIButton *myDetailButton = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];	
		[myDetailButton setTag:[((PlaceMark *)annotation) currentPoint]];
		[myDetailButton addTarget:self action:@selector(detailDiscolosureIndicatorSelected:) forControlEvents:UIControlEventTouchUpInside]; 
		[annotationView setRightCalloutAccessoryView:myDetailButton];
		[annotationView setCanShowCallout:YES];
		
		return annotationView;
		
	} else {
		
		MKAnnotationView *annotationView = (MKAnnotationView *)[myMapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
		return annotationView;
	}
	
}

- (void) detailDiscolosureIndicatorSelected:(id)sender {
	
	NSDictionary *item = [storeInfoArr objectAtIndex:[sender tag]];
	
	
	detailView = [[ShopDetailView alloc] init];
	[detailView setItem:item];
	[self.navigationController pushViewController:detailView animated:YES];
	[detailView release];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	[myMapView release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
	
}


@end
