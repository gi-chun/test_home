    //
//  ExMapkit.m
//  Example
//
//  Created by dwcomms on 11. 3. 7..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ExMapkit.h"


@implementation ExMapkit


- (void)viewDidLoad {
    [super viewDidLoad];
       
    myMapView= [[MKMapView alloc] initWithFrame:self.view.bounds];
    myMapView.showsUserLocation = TRUE;
  
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.02; 
    span.longitudeDelta=0.02;
    
    CLLocationCoordinate2D location = myMapView.userLocation.location.coordinate;
        
    region.span = span;
    region.center = location;
    
    [myMapView setRegion:region animated:TRUE]; 
    [myMapView regionThatFits:region];
    
    
    [self.view addSubview:myMapView];    
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	
}

- (void)dealloc {
    [super dealloc];
	
}

@end
