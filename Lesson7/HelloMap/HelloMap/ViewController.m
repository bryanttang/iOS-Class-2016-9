//
//  ViewController.m
//  HelloMap
//
//  Created by bryant tang on 4/29/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    (22.262769, 114.193054)
    
//    [self setMapLocation:CGPointMake(40.759211, -73.984638)];
//    
//    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
//    pin.coordinate = CLLocationCoordinate2DMake(40.759211, -73.984638);
//    pin.title = @"Hello";
//    
//    [_myMap addAnnotation:pin];
    
    
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 1;
    
    [locationManager startUpdatingLocation];
    
    
    ironMan = [[MKPointAnnotation alloc] init];
    ironMan.coordinate = locationManager.location.coordinate;
    ironMan.title = @"I'm here!";
    
    [_myMap addAnnotation:ironMan];

    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = [locations lastObject];
    
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          location.coordinate.latitude,
          location.coordinate.longitude);
    
    [self setMapLocation:CGPointMake(location.coordinate.latitude, location.coordinate.longitude) ];
    
    [ironMan setCoordinate:location.coordinate];

    
    
    
}


- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
//    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] init];
//    pinView.annotation = annotation;
//    pinView.pinColor = MKPinAnnotationColorPurple;
//    pinView.canShowCallout = YES;
//    pinView.draggable = YES;
    
    MKAnnotationView *customView = [[MKAnnotationView alloc] init];
    customView.annotation = annotation;
    customView.image = [UIImage imageNamed:@"ironman"];
    customView.canShowCallout = YES;
    customView.draggable = YES;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    customView.rightCalloutAccessoryView = rightButton;
    
    UIImageView *myHeadImg = [[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:@"person_head"]];
    customView.leftCalloutAccessoryView = myHeadImg;
    
    
    return customView;
}


- (void)setMapLocation:(CGPoint)center{
    
    CLLocationCoordinate2D coordinate =  CLLocationCoordinate2DMake(center.x,center.y);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    
    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coordinate, span);
    
    _myMap.region = theRegion;
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
