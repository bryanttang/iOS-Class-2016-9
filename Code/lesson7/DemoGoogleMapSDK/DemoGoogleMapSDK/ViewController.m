//
//  ViewController.m
//  DemoGoogleMapSDK
//
//  Created by bryant on 6/8/15.
//  Copyright (c) 2015 cpttm. All rights reserved.
//

#import "ViewController.h"
@import GoogleMaps;

@interface ViewController ()

@end

@implementation ViewController{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:10];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;
    
   
    GMSMutablePath *path = [GMSMutablePath path];
    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.00)];
    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.40)];
    [path addCoordinate:CLLocationCoordinate2DMake(-33.70, 151.40)];
    [path addCoordinate:CLLocationCoordinate2DMake(-33.70, 151.00)];
    [path addCoordinate:CLLocationCoordinate2DMake(-33.90, 151.00)];
    
    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
    rectangle.map = mapView_;
    
    
    mapView_.settings.consumesGesturesInView = NO;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToLongPress:)];
    
    [mapView_ addGestureRecognizer:longPress];
    
    
    
}


- (void) respondsToLongPress:(UILongPressGestureRecognizer*) recoginzer{

    if (recoginzer.state == UIGestureRecognizerStateBegan) {
        CGPoint finger_point = [recoginzer locationInView:mapView_];
        CLLocationCoordinate2D finger_coord = [mapView_.projection coordinateForPoint: finger_point];
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = finger_coord;   //CLLocationCoordinate2DMake(-33.86, 151.20);
        marker.title = @"Me";
        marker.snippet = @"Hey!";
        marker.map = mapView_;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

@end
