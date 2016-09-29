//
//  ViewController.m
//  HelloMap2
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToLongPress:)];
    
    [_myMap addGestureRecognizer:gesture];
    
    //Create a Location Manager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    //Authorization and add key info.plist
    [locationManager requestAlwaysAuthorization];
    [locationManager requestWhenInUseAuthorization];
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 1;
    
    [locationManager startUpdatingLocation];
    
    
    //Create a pin
    mylocation = [[MKPointAnnotation alloc] init];
    mylocation.coordinate = locationManager.location.coordinate; //CLLocationCoordinate2DMake(22.196958, 113.545776);
    mylocation.title = @"I'm here";
    
    //Add to map
    [_myMap addAnnotation:mylocation];
    
    
    CLLocationCoordinate2D coordinate = locationManager.location.coordinate;//  CLLocationCoordinate2DMake();
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);

    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coordinate, span);

    _myMap.region = theRegion;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTap:)];
    
    
    [_myMap addGestureRecognizer:tap];
    
    
    

}


- (void)respondsToTap:(UITapGestureRecognizer*)sender{
    
    //NSLog(@"%ld", sender.numberOfTouches);
    //NSLog(@"responds to tap");
    
    CGPoint point = [sender locationInView:_myMap];
    //NSLog(@"x=%g,  y=%g", point.x, point.y);
    
    CLLocationCoordinate2D coordate = [_myMap convertPoint:point toCoordinateFromView:_myMap];
    
    //Create new Pin
    MKPointAnnotation *newPin = [[MKPointAnnotation alloc] init];
    newPin.coordinate = coordate;
    
    [_myMap addAnnotation:newPin];
    
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = [locations lastObject];
    
//    CLLocationCoordinate2D coordinate = location.coordinate;//  CLLocationCoordinate2DMake();
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
//    
//    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coordinate, span);
//    
//    _myMap.region = theRegion;
    
    //update pin location
    [mylocation setCoordinate:location.coordinate];
    
    
}




- (void)respondsToLongPress:(id)sender{

//    22.196958, 113.545776
    
    
    CLLocationCoordinate2D coordinate =  CLLocationCoordinate2DMake(22.196958, 113.545776);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    
    MKCoordinateRegion theRegion = MKCoordinateRegionMake(coordinate, span);
    
    _myMap.region = theRegion;
    
    
}


-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKAnnotationView *customView = [[MKAnnotationView alloc] init];
    customView.annotation = annotation;         //for coordinate and info
    customView.image = [UIImage imageNamed:@"ironman"];
    customView.canShowCallout = YES;
    
    return customView;
    
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
