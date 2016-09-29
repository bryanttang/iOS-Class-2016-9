//
//  ViewController.h
//  HelloMap2
//
//  Created by bryant tang on 5/6/15.
//  Copyright (c) 2015 CPTTM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    MKPointAnnotation *mylocation;
}
@property (strong, nonatomic) IBOutlet MKMapView *myMap;


@end

