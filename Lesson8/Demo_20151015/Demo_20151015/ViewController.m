//
//  ViewController.m
//  Demo_20151015
//
//  Created by bryant on 15/10/15.
//  Copyright © 2015 cpttm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(22.286211, 114.148842);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.007, 0.007);
    
    _myMap.region = MKCoordinateRegionMake(coord, span);
    _myMap.delegate = self;
    
    pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = CLLocationCoordinate2DMake(22.286211, 114.148842);
    pin.title = @"I am here!";
    
    [_myMap addAnnotation:pin];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 11; //meters
    
    [locationManager startUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *myLocation =  [locations lastObject];
    
    
    NSLog(@"%f", myLocation.coordinate.latitude);
    NSLog(@"%f", myLocation.coordinate.longitude);
    
    
    //Update region of map
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(myLocation.coordinate.latitude, myLocation.coordinate.longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.007, 0.007);
    
    _myMap.region = MKCoordinateRegionMake(coord, span);
    
    //remove pin
    [_myMap removeAnnotation:pin];
    
    //add current pin
    pin.coordinate = CLLocationCoordinate2DMake(myLocation.coordinate.latitude, myLocation.coordinate.longitude);
    pin.title = @"I am here!";
    
    [_myMap addAnnotation:pin];
    
    
}




- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] init];
    annotationView.annotation = annotation;
    annotationView.image = [UIImage imageNamed:@"ironman"];
    annotationView.canShowCallout = YES;
    annotationView.draggable = YES;
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ironman"]];
    annotationView.leftCalloutAccessoryView = image;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
    annotationView.rightCalloutAccessoryView = btn;
    
    
    return annotationView;
}

- (void)clickAdd:(id)sender{
    NSLog(@"Hello!");
}







                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
