//
//  PropertyMapViewController.m
//  Snowy
//
//  Created by Taylan Pince on 10-02-02.
//  Copyright 2010 Hippo Foundry. All rights reserved.
//

#import "Property.h"
#import "PropertyMapViewController.h"

#define cellIdentifier @"mapCell"


@implementation PropertyMapViewController

@synthesize location;

- (void)loadView {
	MKMapView *mapView = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	[mapView setDelegate:self];
	
	self.view = mapView;
	
	[mapView release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setTitle:location.name];
	[self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.08 green:0.247 blue:0.482 alpha:1.0]];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	CLLocationCoordinate2D coordinates;
	
	coordinates.latitude = location.latitude;
	coordinates.longitude = location.longitude;
	span.latitudeDelta = 0.2;
	span.longitudeDelta = 0.2;
	region.span = span;
	region.center = coordinates;
	
	[(MKMapView *)self.view setRegion:region animated:NO];
	[(MKMapView *)self.view regionThatFits:region];
	
	for (Property *property in location.properties) {
		[(MKMapView *)self.view addAnnotation:property];
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:cellIdentifier];
	
    if (pin == nil) {
        pin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:cellIdentifier] autorelease];
		
		[pin setPinColor:MKPinAnnotationColorRed];
		[pin setAnimatesDrop:YES];
		[pin setCanShowCallout:YES];
		
		UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		
		[pin setRightCalloutAccessoryView:button];
    }
    
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	NSLog(@"PROPERTY TAPPED");
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